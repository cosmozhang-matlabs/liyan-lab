figure;

layout = [2 1];
text_pos = [0.02 0.95];
font_size = 20;


ylimval = [-35 35];
xlimval = [min([wts_years hs_years]), max([wts_years hs_years])];

subfig_margin = [0.1 0.1];
subfig_size = [0.8 0.4];
subfig_padding = [1 1] - (fliplr(layout).*subfig_size + subfig_margin*2) ./ max(fliplr(layout)-1, [1 1]);

% color_health = hex2color('5CACEE');
% color_health = hex2color('00f');
color_health = hex2color('bfbfbf');
% color_unhealth = hex2color('F4A460');
% color_unhealth = hex2color('DC143C');
color_unhealth = hex2color('7e7e7e');

subfig_id = [1 2];
subplot('Position', [subfig_margin + (subfig_id - 1).*(subfig_size + subfig_padding), subfig_size] );
[ax_health, ax_unhealth, h_health, h_unhealth] = draw_dual_bar(hs_years,hs_health,hs_unhealth);
set(h_health, 'FaceColor', color_health);
set(h_unhealth, 'FaceColor', color_unhealth);
set(h_health, 'EdgeColor', 'none');
set(h_unhealth, 'EdgeColor', 'none');
ylabel(ax_health, 'Number of individuals');
ylim(ax_health, ylimval);
ylim(ax_unhealth, ylimval);
xlim(ax_health, xlimval);
xlim(ax_unhealth, xlimval);
set(ax_health, 'xticklabel', '');
set(ax_unhealth, 'xticklabel', '');
set(ax_health, 'FontSize', font_size);
set(ax_unhealth, 'FontSize', font_size);
set(ax_health, 'LineWidth', 2);
set(ax_unhealth, 'LineWidth', 2);
% title(ax_health, 'Hengshan');
text('String', '(a)', 'Units', 'normalized', 'FontSize', font_size, 'Position', text_pos);
% legend(ax_health,   {'Healthy  '}, 'Position', [0.763 0.85 0.11 0.02], 'Box', 'on');
% legend(ax_unhealth, {'Unhealthy'}, 'Position', [0.77 0.82 0.1 0.02], 'Box', 'on');
% legend([h_health,h_unhealth],{'Healthy','Unhealthy'}, 'Parent', gcf);

ax_legend = axes('Position',ax_health.Position,'Color','none');
set(ax_legend, 'xtick', []);
set(ax_legend, 'ytick', []);
set(ax_legend, 'xlim', [0 1]);
set(ax_legend, 'ylim', [0 1]);
rectangle('Position', [0.8 0.94 0.04 0.03], 'FaceColor', color_health);
text(0.85, 0.95, 'Healthy', 'FontSize', font_size);
rectangle('Position', [0.8 0.88 0.04 0.03], 'FaceColor', color_unhealth);
text(0.85, 0.89, 'Unealthy', 'FontSize', font_size);

subfig_id = [1 1];
subplot('Position', [subfig_margin + (subfig_id - 1).*(subfig_size + subfig_padding), subfig_size] );
[ax_health, ax_unhealth, h_health, h_unhealth] = draw_dual_bar(wts_years,wts_health,wts_unhealth);
set(h_health, 'FaceColor', color_health);
set(h_unhealth, 'FaceColor', color_unhealth);
set(h_health, 'EdgeColor', 'none');
set(h_unhealth, 'EdgeColor', 'none');
ylabel(ax_health, 'Number of Individuals');
ylim(ax_health, ylimval);
ylim(ax_unhealth, ylimval);
xlim(ax_health, xlimval);
xlim(ax_unhealth, xlimval);
ax_health.XLabel.String = 'Year';
set(ax_health, 'FontSize', font_size);
set(ax_unhealth, 'FontSize', font_size);
set(ax_health, 'LineWidth', 2);
set(ax_unhealth, 'LineWidth', 2);
% title(ax_health, 'Wutaishan');
text('String', '(b)', 'Units', 'normalized', 'FontSize', font_size, 'Position', text_pos);

% mprintfig('savename','dualbar','sizemode','single','dims',layout,'size',[15,7],'printscale',1);



