function [  ] = mprintfig(varargin)

SavePath = '~/Downloads/';
SaveName = 'fig';
SizeMode = 'total'; % total | single
UnitName = 'inches'; % Unit properties
resolution_rate = '-r300'; % resolution options
Dims = [1 1];
Size = [15 7];
PrintScale = 1;

for i = 1:2:nargin
    if strcmpi(varargin{i}, 'SizeMode')
        SizeMode = varargin{i+1};
    elseif strcmpi(varargin{i}, 'Dims')
        Dims = varargin{i+1};
    elseif strcmpi(varargin{i}, 'UnitName')
        UnitName = varargin{i+1};
    elseif strcmpi(varargin{i}, 'Size')
        Size = varargin{i+1};
    elseif strcmpi(varargin{i}, 'PrintScale')
        PrintScale = varargin{i+1};
    elseif strcmpi(varargin{i}, 'SavePath')
        SavePath = varargin{i+1};
    elseif strcmpi(varargin{i}, 'SaveName')
        SaveName = varargin{i+1};
    end
end

BasePosition = [0 0 Size];
TotalPosition = [0 0 Size];
if strcmpi(SizeMode, 'single')
    TotalPosition = BasePosition.*[1 1 fliplr(Dims)];
end
set(gcf,'resize','off');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf,'unit',UnitName);
set(gcf,'position',TotalPosition);
set(gcf,'paperunits',UnitName);
set(gcf,'paperposition',TotalPosition * PrintScale);

print(gcf, '-dtiff', resolution_rate, sprintf('%s.tiff', [SavePath SaveName]));

end

