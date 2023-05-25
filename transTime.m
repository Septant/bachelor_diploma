function tsettling = transTime(delta, trueFr,eigsType)

mus = [1 25 5 10];
size = ".mat";
tsettling = zeros(1, 4);

tol = delta*trueFr;

for i = 1:length(mus)
    load("pure"+eigsType+mus(i)+"R1"+size);
    time = approx_data(1,:);
    fr1 = approx_data(2,:);
    fr2 = approx_data(3,:);
    
    idx1 = find(abs(fr1 - trueFr(1)) > tol(1));
    idx2 = find(abs(fr2 - trueFr(2)) > tol(2));
    tsettling(i) = ceil(time(max(idx1(end),idx2(end)))) *10000;
    
end


