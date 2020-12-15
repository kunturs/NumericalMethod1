function poly = horner(a)
x = [-3 0 1];
n = length (x);
poly = x(n);

for i=1:(n-1)
    poly = x(n-i) + a*poly;
end

