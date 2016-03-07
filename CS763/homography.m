function [H] = homography(image1, image2)

points = match(image1, image2);

y1 = points(:,1);
x1 = points(:,2);
y2 = points(:,3);
x2 = points(:,4);
n = size(x1);

A = [-x1 -y1 -ones(n) zeros(n) zeros(n) zeros(n) x2.*x1 x2.*y1 x2; ...
	zeros(n) zeros(n) zeros(n) -x1 -y1 -ones(n) y2.*x1 y2.*y1 y2];

[U, D, V] = svd(A);
h = V(:, 9)';
H = reshape(h, 3, 3)';
H = H ./ H(3,3);

end