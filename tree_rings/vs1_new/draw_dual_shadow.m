function [ h ] = draw_dual_shadow( ax, data, years, base_num, color_above, color_below, alpha )
%DRAW_DUAL_SHADOW Summary of this function goes here
%   Detailed explanation goes here

if nargin < 7
    alpha = 1;
end
if nargin < 6
    color_below = 'b';
end
if nargin < 5
    color_above = 'r';
end
if nargin < 4
    base_num = 1;
end

last_data = data(1);
last_year = years(1);
% above_data = base_num;
% above_years = last_year;
% below_data = base_num;
% below_years = last_year;
above_data = [];
above_years = [];
below_data = [];
below_years = [];
if last_data > base_num
    above_years = [above_years, last_year];
    above_data = [above_data, last_data];
else
    below_years = [below_years, last_year];
    below_data = [below_data, last_data];
end
for i = 2:size(years,2)
    if data(i) > base_num
        if last_data <= base_num
            cross_point = last_year + (years(i) - last_year) * (base_num - last_data) / (data(i) - last_data);
            above_years = [above_years, cross_point];
            above_data = [above_data, base_num];
            below_years = [below_years, cross_point];
            below_data = [below_data, base_num];
        end
        above_years = [above_years, years(i)];
        above_data = [above_data, data(i)];
    else
        if last_data > base_num
            cross_point = last_year + (years(i) - last_year) * (base_num - last_data) / (data(i) - last_data);
            above_years = [above_years, cross_point];
            above_data = [above_data, base_num];
            below_years = [below_years, cross_point];
            below_data = [below_data, base_num];
        end
        below_years = [below_years, years(i)];
        below_data = [below_data, data(i)];
    end
    last_year = years(i);
    last_data = data(i);
end

h = plot(years, data, 'k');
hold on;
plot(years, zeros(1, size(data,2)) + base_num, '--k');
hold on;
fill([above_years, above_years(end), above_years(1)], [above_data, base_num, base_num], color_above, 'EdgeColor', 'none', 'FaceAlpha', alpha);
fill([below_years, below_years(end), below_years(1)], [below_data, base_num, base_num], color_below, 'EdgeColor', 'none', 'FaceAlpha', alpha);
xlim([years(1),years(end)]);

end

