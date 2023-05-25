%% signal y(t)
n = 2;
omega1 = 2;
omega2 = 3;
phi1 = 0;
phi2 = 0;
amp1 = 1;
amp2 = 1;
Omega = [omega1; omega2];
omega0 = [2; 5];
 A0 = 0;
      
%% DREM
% h_my = 0.1;
% 
% tau_my = 0.13;
% k_my = 10;
% gamma_my = 1;

h_my = 0.3;

tau_my = 0.3;
k_my = 100;
gamma_my = 0.01;

c1 = cos(omega1*h_my);
c2 = cos(omega2*h_my);

theta_real = [-c1-c2; c1*c2];
theta0_my = [-2; 1];

omega_max = 10; omega_min = 1;

