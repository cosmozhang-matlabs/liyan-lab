% author: Cosmo Zhang
% email: cosmozhang1995@gmail.com
% page: http://www.cosmozhang.com/
% bug report: https://github.com/cosmozhang1995

function [ gscore, gscore1, gscore2 ] = glk( data1, data2, epsilon )
%GLK Calculate the Kolisearska score of data1 and data2
% epsilon: (optional) the epsilon of o. Default is MATLAB `eps`

if nargin < 3
    epsilon = eps;
end

d_data1 = data1(2:end) - data1(1:end-1);
d_data2 = data2(2:end) - data2(1:end-1);

gscore1 = (abs(d_data1) > epsilon) .* ((d_data1 > 0) - 1/2);
gscore2 = (abs(d_data2) > epsilon) .* ((d_data2 > 0) - 1/2);

gscore = nanmean(abs(gscore1 + gscore2));


end

