function t = GroupDelay(f,phase)
k = size(phase)

for n = 2:k-1
    t(n) = (-1/720) * (((phase(n) - phase(n - 1)) / (f(n) - f(n - 1))) + ((phase(n + 1) - phase(n)) / (f(n + 1) - f(n))));
end
%t(1) = (-1/360) * (((phase(2) - phase(1))/(f(2) - f(1))));
%t(k) = (-1/360) * (((phase(k) - phase(k - 1))/(f(k) - f(k - 1))));
end