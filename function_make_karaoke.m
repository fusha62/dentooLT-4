%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  Make Karaoke file for wav Audio  %%%%%
%%%%%                   for Dentoo LT 4 %%%%%
%%%%%            written by T.Minagawa  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function bgm = function_make_karaoke(data)
%% Karaoke making !!
bgm=data-circshift(data,[0,1]);
