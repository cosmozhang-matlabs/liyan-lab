figure(1);
% dims = [size(wts_hs_modes,1) 3];
% for i = 1:size(wts_hs_modes,1)
%     for ii = 1:size(wts_hs_modes{i},1)
%         ds = wts_hs_modes{i}{ii};
%         subplot(dims(1),dims(2),dims(2)*(i-1)+ii);
%         draw_dual_shadow(ds.data, ds.years);
%         title(ds.name);
%     end
% end

dims = [2 3];
ascii = int16('a');
figw = 0.27;
figh = 0.4;
figwp = (1 - dims(2) * figw - 0.01) / dims(2);
fighp = (1 - dims(1) * figh) / 2;
iii = 1;
for i = 1:2
    for ii = 1:3
        subx = ii;
        suby = 3-i;
        idx = (i-1)*3+ii;
        dsl = wts_hs_modes{idx};
        dsl_size = size(dsl,1);
        subplot(dims(1),dims(2),dims(2)*(suby - 1)+subx);
%         subplot(dims(1),dims(2),iii);
        alpha = 0.75;
        ylim = [0 2.7];
        ytick = ylim(1):0.5:ylim(end);
        if (dsl_size > 1) && isa(dsl{2}, 'struct')
%             color = [0.7, 1, 0.7];
            color = [1 1 1] * 0.5;
%             color = hex2color('DC143C');
            h = draw_dual_shadow(dsl{2}.data, dsl{2}.years, 1, color, color, 1);
            set(h, 'LineWidth', 1);
            hold on;
        end
        if (dsl_size > 2) && isa(dsl{3}, 'struct')
%             color = [1, 0.7, 0.7];
            color = [1 1 1] * 0.7;
%             color = hex2color('0000FF');
            h = draw_dual_shadow(dsl{3}.data, dsl{3}.years, 1, color, color, 0.6);
            set(h, 'LineWidth', 1);
            hold on;
        end
        if (dsl_size > 0) && isa(dsl{1}, 'struct')
%             color = [0.7, 0.7, 1];
            color = [1 1 1] * 0;
%             color = hex2color('2E8B57');
            h = draw_dual_shadow(dsl{1}.data, dsl{1}.years, 1, color, color, 0);
            set(h, 'LineWidth', 2);
            set(h, 'Color', color);
            hold on;
        end
%         title(dsl{1}.name);
%         title(char(ascii + dims(2)*(2-i) + ii - 1));
        set(gca, 'ylim', ylim);
        set(gca, 'ytick', ytick);
        set(gca, 'box', 'on');
        if suby ~= dims(1)
            set(gca, 'xticklabel', []);
        end
        position = [figwp + (ii - 1) * (figw + figwp), fighp + (i - 1) * figh, figw, figh];
        set(gca, 'position', position);
        text('String', [(char(ascii + dims(2)*(suby-1) + subx - 1)) ')'],...
            'Units', 'normalized', 'Position', [0.02 0.95], 'FontSize', 24);
        if suby == dims(1)
            xlabel('Year');
        end
        if subx == 1
            ylabel('Tree-ring indices');
        end
        set(gca, 'fontunits','points');
        set(gca, 'FontSize', 20);
        set(gca, 'LineWidth', 1.5);
        iii = iii + 1;
    end
end

mprintfig('savename','dualshadow','sizemode','single','dims',dims,'size',[5,4.76],'printscale',1);
