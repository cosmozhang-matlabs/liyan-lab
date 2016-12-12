function [ ax1,ax2,h1,h2 ] = draw_dual_bar( datax, data1, data2 )

maxx = max(datax);
minx = min(datax);
xlimval = [minx-1,maxx+1];
max1 = max(data1);
max2 = max(data2);

h1 = bar(datax, data1, 1);
hold on;
ax1 = gca;
ax2 = axes('Position',ax1.Position,'XAxisLocation','bottom','YAxisLocation','right','Color','none');
h2 = bar(datax, data2, 1, 'Parent', ax2);
set(ax2, 'YAxisLocation','right');
set(ax2, 'Color','none');
set(ax1, 'xlim', xlimval);
set(ax2, 'xlim', xlimval);
set(ax1, 'ylim', [-max2 max1]);
set(ax2, 'ylim', [-max1 max2]);
set(ax2, 'ydir', 'reverse');
set(ax2, 'XTickLabel', '');

end

