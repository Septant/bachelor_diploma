function selection = selectionToCheck(file1, file2, file3, file4, tsettlers)

files = [file1,file2,file3,file4];

selection = cell(1,4);

for i = 1:4
    load(files(i));
    fr1 = approx_data(2,:);
    fr2 = approx_data(3,:);
    selection{i} = [fr1(tsettlers(i):end);fr2(tsettlers(i):end)];
end
