

syms x

%rc = 0.5*(1+ cos(x));
%rs = (-1/(pi^2))*(x^2-pi^2)*sin(x);
f = 1/(1+x^2);
%dx = -2*x*(1/(1+x^2)^2);

X = [-5:0.5:5];
Y = 1./(1+X.^2);
DX = -2*X.*(1./(1+X.^2).^2);
n=20;
sum = 0;

for i =1: n+1
    sum = sum + Y(i)*0.5*(1+ cos(x))+ DX(i)*(-1/(pi^2))*(x^2-pi^2)*sin(x); 
end
sum 
expand(sum)
fplot(sum)
hold on
fplot(f)
