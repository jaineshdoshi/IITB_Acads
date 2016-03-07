function [output] = warp(image, H)

imagesize = size (image);

y = linspace(1, imagesize(1), imagesize(1))';
x = linspace(1, imagesize(2), imagesize(2))';

[X Y] = meshgrid(x, y);
map = [X(:) Y(:)];
map = [map ones(size(map,1) ,1)];

reverse = H \ map';
forward = zeros(imagesize);

for i = 1: size(reverse, 2)
	p = reverse(:, i);
	coordx = p(1)/p(3);
	coordy = p(2)/p(3);
	tx = floor(coordx);
	ty = floor(coordy);

	if ((0 < tx) && (tx < imagesize(2)) && (0 < ty) && (ty < imagesize(1)) )
		fincoordx = map(i, 1);
		fincoordy = map(i, 2);
		w1 = (tx + 1 - coordx)*(ty + 1 - coordy);
		w2 = (coordx - tx)*(ty + 1 - coordy);
		w3 = (coordx - tx)*(coordy - ty);
		w4 = (tx + 1 - coordx)*(coordy - ty);
		forward(fincoordy, fincoordx) = w1*image(ty, tx) + w2*image(ty, tx + 1) + w3*image(ty + 1, tx) + w4*image(ty + 1, tx + 1);
	end
end

output = forward;
end
