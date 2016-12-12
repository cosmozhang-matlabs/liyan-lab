function [ corr_matrix ] = draw_corr_matrix( varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

data = varargin{1};

color_map = 'jet';
color_bar = 0;
no_draw = 0;

for i = 2:nargin
    if strcmp(varargin{i}, 'colormap')
        color_map = varargin{i+1};
        i = i+1;
    elseif strcmp(varargin{i} , 'colorbar')
        color_bar = 1;
    elseif strcmp(varargin{i} , 'nocolorbar')
        color_bar = 0;
    elseif strcmp(varargin{i} , 'draw')
        no_draw = 0;
    elseif strcmp(varargin{i} , 'nodraw')
        no_draw = 1;
    end
end

data_size = size(data, 1);
if data_size == 1
    data_size = size(data, 2);
end

corr_matrix = zeros(data_size,data_size);

for i = 1:data_size
    corr_matrix(i,i) = 1;
    for j = (i+1):data_size
        corr_effc = nancorr(data(i,:), data(j,:));
        corr_matrix(i,j) = corr_effc;
        corr_matrix(j,i) = corr_effc;
    end
end

if ~no_draw
    imagesc(corr_matrix), axis equal;
    colormap(color_map);
    if color_bar
        colorbar;
    end
end

end

