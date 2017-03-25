function [  ] = do_count_trees(  )

load('wts_hs_modes.mat');
for i = 1:size(wts_hs_modes,1)
    dsl_item = wts_hs_modes{i};
    if isempty(dsl_item)
        continue;
    end
    fprintf('%s :  %d\n', dsl_item.name, max(size(dsl_item.indexes)));
end

end

