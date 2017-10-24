function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
[sortedValues,sortIndex] = sort(H(:),"descend");  %# Sort the values in
                                                  %#   descending order
maxIndex = sortIndex(1:20);  %# Get a linear index into A of the 5 largest values
for idx = 1:length(maxIndex)
  pk_col(idx) = round(maxIndex(idx)/size(H,1));
  pk_row(idx) = mod(maxIndex(idx),size(H,1));
endfor

    % TODO: Your code here
    pkr=[pk_row-854];
    pkc=[pk_col-90 ];
    peaks = [pkr;pkc]';
    
endfunction
