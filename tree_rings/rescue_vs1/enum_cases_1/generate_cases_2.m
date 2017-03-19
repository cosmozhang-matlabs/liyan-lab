function [ test_cases ] = generate_cases(  )

test_cases = load('../wts_hs_modes.mat');
test_cases = test_cases.wts_hs_modes;

cnt = 0;

for i = 1:size(test_cases,1)
    for j = 1:size(test_cases{i},1)
        fprintf('%s %d\n', test_cases{i}{j}.name, test_cases{i}{j}.nmode);
        if strcmpi(test_cases{i}{j}.name, 'hs 1825-1855 20')
            test_cases{i}{j}.certain = [5 11 12 20 8];
            test_cases{i}{j}.uncertain = [2];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1825-1855 8')
            test_cases{i}{j}.certain = [3 4 14 17 19];
            test_cases{i}{j}.uncertain = [9 13 1];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1825-1855 other')
            test_cases{i}{j}.certain = [6 7 10 15 16];
            test_cases{i}{j}.uncertain = [2 9 13 1];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1900-1940 20')
            test_cases{i}{j}.certain = [11 13 18];
            test_cases{i}{j}.uncertain = [14 15 17];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1900-1940 8')
            test_cases{i}{j}.certain = [1 2 3 4 6 7 8 10];
            test_cases{i}{j}.uncertain = [];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1900-1940 other')
            test_cases{i}{j}.certain = [5 9 16 19 20 12];
            test_cases{i}{j}.uncertain = [14 15 17];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1960-2012 20')
            test_cases{i}{j}.certain = [2 3 4 13 16];
            test_cases{i}{j}.uncertain = [1 6];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1960-2012 8')
            %test_cases{i}{j}.certain = [];
            %test_cases{i}{j}.uncertain = [];
            %cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'hs 1960-2012 others')
            test_cases{i}{j}.certain = [10 11 12 14 17 18 19 20 7 8 15 9];
            test_cases{i}{j}.uncertain = [1 6];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1825-1855 20')
            test_cases{i}{j}.certain = [2 4];
            test_cases{i}{j}.uncertain = [15 9 16 17 20 22];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1825-1855 8')
            test_cases{i}{j}.certain = [1 5 18 21 27 28 34 36];
            test_cases{i}{j}.uncertain = [9 10 16 17 20 23 29 15 6];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1825-1855 others')
            test_cases{i}{j}.certain = [3 7 12 13 19 22 25 26 30 31 32 35];
            test_cases{i}{j}.uncertain = [6 10 29];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1900-1940 20')
            test_cases{i}{j}.certain = [7 9 18 22 23 27 13 28 8];
            test_cases{i}{j}.uncertain = [];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1900-1940 8')
            test_cases{i}{j}.certain = [5 11 15 25 32];
            test_cases{i}{j}.uncertain = [34 3 4 14 16 17 24 26];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1900-1940 others')
            test_cases{i}{j}.certain = [1 2 6 10 12 19 20 21 29 30 31 33 35 36];
            test_cases{i}{j}.uncertain = [3 4 8 13 14 16 17 24 26 28 34];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1960-2012 20')
            %test_cases{i}{j}.certain = [];
            %test_cases{i}{j}.uncertain = [];
            %cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1960-2012 8')
            test_cases{i}{j}.certain = [5 6 8 9 10 11 12 13 20 25 28 29 34];
            test_cases{i}{j}.uncertain = [3 14 22 26 30 33 36];
            cnt = cnt + 1;
        elseif strcmpi(test_cases{i}{j}.name, 'wts 1960-2012 others')
            test_cases{i}{j}.certain = [2 4 7 15 17 18 19 21 24 27 31 32];
            test_cases{i}{j}.uncertain = [3 14 22 26 30 33 36];
            cnt = cnt + 1;
        end
    end
end

save('test_cases.mat', 'test_cases');

fprintf('Total %d cases\n', cnt);

end

