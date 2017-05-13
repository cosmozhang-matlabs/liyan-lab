function do_draw_dual_shadow

close all;

xtick_interval = 5;

addpath('../sbin');

gen_data();

figure;
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
figw = 0.26;
figh = 0.4;
figwp = (1 - dims(2) * figw - 0.04) / dims(2);
fighp = (1 - dims(1) * figh) / 2;

load('wts_hs_modes.mat');

axs = cell(dims(1)*dims(2), 1);

for i = 1:size(wts_hs_modes,1)
    dsl_item = wts_hs_modes{i};
    if isempty(dsl_item)
        continue;
    end
    subx = dsl_item.yearn-1;
    suby = dsl_item.siten-1;
    subp = dims(2)*suby+subx+1;
    if isempty(axs{subp})
        subplot(dims(1), dims(2), subp);
        axs{subp} = gca;
    end
    alpha = 0.75;
    ylim = [0 2.2];
    ytick = ylim(1):0.5:ylim(end);

    dsl_data = dsl_item.data;
    dsl_years = dsl_item.years;
    if size(dsl_data, 2) == 1
        dsl_data = dsl_data';
    end
    if size(dsl_years, 2) == 1
        dsl_years = dsl_years';
    end

    if dsl_item.typen == -1
        color = [1 1 1] * 0.5;
        h = draw_dual_shadow(axs{subp}, dsl_data, dsl_years, 1, color, color, 1);
        set(h, 'LineWidth', 1);
        hold on;
    end
    if dsl_item.typen == 8
        color = [1 1 1] * 0.7;
        h = draw_dual_shadow(axs{subp}, dsl_data, dsl_years, 1, color, color, 0.6);
        set(h, 'LineWidth', 1);
        hold on;
    end
    if dsl_item.typen == 20
        color = [1 1 1] * 0;
        h = draw_dual_shadow(axs{subp}, dsl_data, dsl_years, 1, color, color, 0);
        set(h, 'LineWidth', 2);
        set(h, 'Color', color);
        hold on;
    end

%         title(dsl{1}.name);
%         title(char(ascii + dims(2)*(2-i) + ii - 1));
    set(gca, 'ylim', ylim);
    set(gca, 'ytick', ytick);
    set(gca, 'box', 'on');
    if suby ~= dims(1) - 1
        set(gca, 'xticklabel', []);
    end
    position = [figwp + subx * (figw + figwp), fighp + (dims(1)-suby-1) * figh, figw, figh];
    set(gca, 'position', position);
    text('String', ['(' (char(ascii + dims(2)*suby + subx)) ')'],...
        'Units', 'normalized', 'Position', [0.02 0.95], 'FontSize', 24);
    if suby == dims(1) - 1
        xlabel('Year');
    end
    if subx == 0
        ylabel('Tree-ring indices');
    end

    % last year must be 2010
    % if subx == dims(2) - 1
    %     set(gca, 'xtick', 1960:25:2010);
    % end

    xtick_begin = ceil(dsl_years(1)/xtick_interval) * xtick_interval;
    set(gca, 'xtick', xtick_begin:xtick_interval:dsl_years(end));

    set(gca, 'fontunits','points');
    set(gca, 'FontSize', 20);
    set(gca, 'LineWidth', 1.5);
end

mprintfig('savename','dualshadow','sizemode','single','dims',dims,'size',[5,4.76],'printscale',1,'Resolution',72);
% close(gcf);

end
