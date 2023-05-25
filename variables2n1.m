%% Сигналы
% исходный сигнал
amp = [1;1];
freq = [2;3];
bias = [0;0];
%bias = [1;1];
phase = [0;0];

% модификации
%amp_M = [1;1];
%freq_M = [1.8;3.2];
%bias_M = [0;0];
%phase_M = [0;0];
%alter
amp_M = [1;1];
freq_M = [1.8;3.2];
bias_M = [0;0];
phase_M = [0;0];

amp_M1 = 0.2;
freq_M1 = 20;
bias_M1 = 0;
phase_M1 = 0;
sample_M1 = 10;


%% Вводные данные системы

simulationTime = 400;

dimension = 2; % число гармоник сигнала
radius = 1;

[eigsBU, eigsNE] = eigs(dimension, radius); % Корни по распределению баттервордта;

r = 1.2; % параметр
alpha = [1,3]; % параметр
mu = 2.5; % параметр
zMax = 5; % максимум нормы оценки состояния z 

maxOmega = max(freq)^2+1; % максимум нормы вектора оценённых частот 
omegaLimiter = sqrt(dimension)*maxOmega;

initialOmega = [2,5]; % Подаваемая частота при t=0

initialTheta = [initialOmega(1)^2-alpha(1);...
    initialOmega(2)^2-alpha(2)]; % подаваемая производная вектора оценки частот при t=0

initialZ = [sin(phase(1)); r^2*cos(phase(1))/initialOmega(1);...
    sin(phase(2)); r^2*cos(phase(2))/initialOmega(2); sum(bias)]; % состояние z при t=0


[L,C,A,delta] = LCAD(dimension, alpha, r, eigsNE);
[L1,C,A,delta] = LCAD(dimension, alpha, r, eigsBU);

bigGammaZ0 = zeros(2*dimension+1, dimension); 

%% Переключатели

turn_mods_on  =  1; % включить моды                                 [0;1;1;1]
noiseOrSwitch =  0; % 1 - noiseSelector. 0 - изменение сигнала      [0;0;1;1]
noiseOrSin    =  0; % 1 - шум. 0 - синус-помеха                     [0;0;0;1]
freqSwitcher  =  [80,150]; % момент переключения модификации (в сек)

