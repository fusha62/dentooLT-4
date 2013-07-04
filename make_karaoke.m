%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  Make Karaoke file for wav Audio  %%%%%
%%%%%                   for Dentoo LT 4 %%%%%
%%%%%            written by T.Minagawa  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% files input
[data, fs] = wavread('./infile.wav');

%% Karaoke making !!
bgm=data-circshift(data,[0,1]);

%% files output
wavwrite(bgm,fs,'./out.wav');