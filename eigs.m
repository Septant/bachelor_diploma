function [eigsBU, eigsNE] = eigs(dim, radius)
n = 4*dim+2;
vals = zeros(1,n);
for k = 0:n-1
    vals(k+1) = radius * exp(1i*2*pi*k/n);
end
eigsBU = vals(real(vals) <= 0);
n = 2*dim+1;

eigsNE = -ones(1,n)*radius;
for i = 2:n
    eigsNE(i) = eigsNE(i-1) - 0.001;
end

