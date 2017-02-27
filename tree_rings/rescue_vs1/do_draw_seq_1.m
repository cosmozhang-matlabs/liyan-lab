function [  ] = do_draw_seq_1(  )

load('wts_36_rawdata.mat');
load('hs_20_rawdata.mat');

% raw_years = wts_36_years;
% raw_data = wts_36_rawdata;
% name = 'Wutaishan';
% 
% datarng = 1:10;
% draw_seq_1(raw_years, raw_data, name, datarng);
% datarng = 11:20;
% draw_seq_1(raw_years, raw_data, name, datarng);
% datarng = 21:30;
% draw_seq_1(raw_years, raw_data, name, datarng);
% datarng = 31:36;
% draw_seq_1(raw_years, raw_data, name, datarng);

raw_years = hs_20_years;
raw_data = hs_20_rawdata/1000;
name = 'Hengshan';

datarng = 1:10;
draw_seq_1(raw_years, raw_data, name, datarng);
datarng = 11:20;
draw_seq_1(raw_years, raw_data, name, datarng);

end

