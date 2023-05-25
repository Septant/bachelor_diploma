%% группа 1. Чистые сигналы с варьированием собственных чисел при A-LC, где L - вектор наблюдателя
%% BU - числа сгенерированы по распределению Баттерворта
%% NE - числа сгенерированы по распределению Ньютона
mods = ["pure" "noise" "sinus" "change"];
eigsType =["NE" "BU"];
radius = ["1" "05" "2"];
mus = [1 25 5 10];
size = ".mat";

load("pureNE1R1.mat");
time = approx_data(1,:);

omega1 = ones(1, length(time))*2;
omega2 = ones(1, length(time))*3;


%% для разных mu
for i = 2:length(mods)
    for j = 1:length(eigsType)
        for k = 1:length(mus)

            fileName = mods(i)+eigsType(j)+num2str(mus(k))+size;
            load(fileName);

            plot_pres4(mods(i)+"_graph_"+eigsType(j)+mus(k), time,...
                approx_data(2,:), omega1, approx_data(3,:), omega2, mus(k));
        end
    end
end

%% для чистых сигналов с разными eigenvalues при A-LC
for i = 1:length(eigsType)
    for j = 1:length(mus)
        for k = 1:length(radius)
            fileName = mods(1)+eigsType(i)+num2str(mus(j))+"R"+radius(k)+size;
            load(fileName);

            plot_pres4(mods(1)+"_graph_"+eigsType(i)+num2str(mus(j))+"R"+radius(k), time,...
                approx_data(2,:), omega1, approx_data(3,:), omega2, mus(j));
        end
    end
end

namesCOMP = ["PURE" "NOISE" "SIN" "CHANGE"];
modeCOMP = ["VED" "BU" "NE"];
mu=25;

for i = 1:4
     fileName = namesCOMP(i)+modeCOMP(1)+size;
     load(fileName);
     plot_pres4(namesCOMP(i)+"_graph_"+modeCOMP(1), time,...
     approx_data(2,:), omega1, approx_data(3,:), omega2);
    for j = 2:3
            fileName = namesCOMP(i)+num2str(mu)+modeCOMP(j)+size;
            load(fileName);

            plot_pres4(namesCOMP(i)+"_graph_"+modeCOMP(j)+num2str(mu), time,...
                approx_data(2,:), omega1, approx_data(3,:), omega2, mu);
    end
end


