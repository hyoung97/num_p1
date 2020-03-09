% MATLAB code for finding the best fit line using least squares method.

% input in the form of matrix, each row is a (x, y).
input = [...
  -5,0.0384615385;...
  -4.5, 0.0470588235;...
  -4, 0.0588235294;...
  -3.5, 0.0754716981 ;...
  -3, 0.1;...
  -2.5, 0.0754716981 ;...
  -2, 0.2;...
  -1.5,0.3076923077 ;...
  -1, 0.5;...
  -0.5, 0.8 ;...
  0, 1;...
  0.5, 0.8;...
  1, 0.5;...
  1.5, 0.3076923077;...
  2, 0.2;...
  2.5, 0.1379310345;...
  3, 0.1;...
  3.5, 0.0754716981;...
  4, 0.0588235294;...
  4.5, 0.0470588235;...
  5, 0.0384615385];

m = size(input, 1);
n = size(input, 2);
x = input(:,1:n-1);
y = input(:,n);
k = m-1;

% mat = [m, sum(x), sum(x^2), sum (x^3), sum(x^4),sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10);
%     sum(x), sum(x^2), sum (x^3), sum(x^4),sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11);
%     sum(x^2), sum (x^3), sum(x^4),sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12);
%     sum (x^3), sum(x^4),sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13);
%     sum(x^4),sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14);
%     sum(x^5), sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15);
%     sum(x^6), sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15), sum(x^16);
%     sum(x^7), sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15), sum(x^16), sum(x^17);
%     sum(x^8), sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15), sum(x^16), sum(x^17), sum(x^18);
%     sum(x^9), sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15), sum(x^16), sum(x^17), sum(x^18), sum(x^19);
%     sum(x^10), sum(x^11), sum(x^12), sum(x^13), sum(x^14), sum(x^15), sum(x^16), sum(x^17), sum(x^18), sum(x^19), sum(x^20)];

fit =polyfit(x,y,20);
y_fit = polyval(fit,x);
plot(x,y);
hold on;
p = poly2sym(fit);
disp(p);
fplot(p);


legend('f', 'interp10');

% The first column of matrix X is populated with ones,
% and the rest columns are the x columns of the input.
X = ones(m, n);
X(:,2:n) = input(:,1:n-1);

% Try to find the a that minimizes the least square error Xa - y.
% Project y onto the C(X) will give us b which is Xa.

% The relationship is X'Xa = X'b

% Use left division \ to solve the equation, which is equivalent
% to a = inverse(X'*X)*X'*y, but computationally cheaper.
a = (X' * X) \ (X' * y);
b = X*a;
least_square_error = sum((b - y) .^ 2);




% Plot the best fit 
