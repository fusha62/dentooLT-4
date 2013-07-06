%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Function of Pitch convert      %%%%%
%%%%%                   for Dentoo LT 4 %%%%%
%%%%%            written by T.Minagawa  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out_mat = function_pitch_conv(win_matrix,rate)
  rate_max = 10;
  windows = hann(size(win_matrix,1));
  out_mat = zeros(size(win_matrix));
  for i = 1 : size(win_matrix,2)
    w_tmp = win_matrix(:,i).*windows;
    tmp_vec = zeros(size(win_matrix,1)*rate_max,1);
    for j = 1:rate_max
      tmp_vec = tmp_vec + ...
	  vertcat(zeros((j-1)*size(win_matrix,1),1),...
		  w_tmp+circshift(w_tmp,floor(length(w_tmp)/2)),...
		  zeros(length(tmp_vec)...
			-((j-1)*size(win_matrix,1)...
			  +length(w_tmp)),1));
    end
    x_t = 1/length(tmp_vec):1/length(tmp_vec):1;
    y_t = rate/length(tmp_vec):rate/length(tmp_vec):1;
    out_tmp = spline(x_t,tmp_vec,y_t);
    out_tmp = out_tmp(1:size(win_matrix,1))';
    out_mat(:,i) = out_tmp;
  end
end