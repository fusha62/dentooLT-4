%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%     Script of Pitch convert       %%%%%
%%%%%                   for Dentoo LT 4 %%%%%
%%%%%            written by T.Minagawa  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setting
% pitch rate
p_rate = 1.8;
% window length
w_len = 512;


%% files input
[data, fs] = wavread('./infile.wav');


%% Pitch convert!!
out_mat = function_sep_window(data(:,1),w_len);
pout_mat = function_pitch_conv(out_mat,p_rate);
out_vec_l = function_merge_window(pout_mat);
out_mat = function_sep_window(data(:,2),w_len);
pout_mat = function_pitch_conv(out_mat,p_rate);
out_vec_r = function_merge_window(pout_mat);
out_vec = horzcat(out_vec_l,out_vec_r);

%% files output
wavwrite(out_vec,fs,'./test.wav');