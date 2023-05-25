function [L, C, A, delta] = LCAD(dimension, alpha, r, eigenvalues)
A = zeros(2*dimension+1 , 2*dimension+1); % осциллятор

%G = zeros(2*dimension+1 , 2*dimension+1);


for k = 1:dimension
    %G(2*k-1:2*k, 2*k-1:2*k) = [0 omega_(k)^2/r^2; -r^2 0];
    A(2*k-1:2*k, 2*k-1:2*k) = [0 (r^2)*alpha(k); -r^2 0];
end


C = zeros(1, 2*dimension+1);
C(1:2:end) = 1;


L = real((place(A',C',eigenvalues))'); % наблюдатель


%A = [0 r^2*alpha 0; -r^2 0 0; 0 0 0];
% Наблюдатель : A - LC: с L таким, что собственные числа{g_i} A-LC < 0
% Транспонируем : A' - L'C'

delta = C*A;

