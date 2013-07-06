%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Window Separation for signal vect %%%%%
%%%%%                   for Dentoo LT 4 %%%%%
%%%%%            written by T.Minagawa  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out_mat = function_sep_window(data,win_len)
  out_mat = zeros(win_len,floor(length(data)/win_len)*2-1);
  windows = hann(win_len);
  for i = 1:floor(length(data)/win_len)*2-1
    out_mat(:,i) = ...
	data(floor(win_len/2)*(i-1)+1:...
	     floor(win_len/2)*(i-1)+win_len)...
	.*windows;
  end;

end
