function tsettling = transTimeR(delta, trueFr,eigsType)



mus = [1 25];
size = ".mat";
tsettling = zeros(2, 3);
R = ["05" "1" "2"];

tol = delta*trueFr;

for i = 1:length(mus)
    for j=1:length(R)
    load("pure"+eigsType+mus(i)+"R"+R(j)+size);
    time = approx_data(1,:);
    fr1 = approx_data(2,:);
    fr2 = approx_data(3,:);
    
    idx1 = find(abs(fr1 - trueFr(1)) > tol(1));
    idx2 = find(abs(fr2 - trueFr(2)) > tol(2));
    tsettling(i,j) = ceil(time(max(idx1(end),idx2(end)))) *10000;
    end
end