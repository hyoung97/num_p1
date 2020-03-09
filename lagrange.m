X = [-5:2:5];
Y = 1./(1+X.^2);
n = 5; %steps
%y is vector of values
syms x;

S = 0;
for i = 1: n+1
    L = 1;
    for j =1: n+1
        if j~=i
           L = L * (x - X(j))/(X(i)-X(j));
        end
    end
    S= S+ Y(i)*L;
end
S
expand(S)
%yp = sm
fplot(S)
hold on



