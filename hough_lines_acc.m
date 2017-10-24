function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
   

    rhoStep = 1;
    theta_mesh = linspace(-90, 90, 181);
    %rho = linspace(-364, 363, 728);
    rho = linspace(-854, 853, 1707);
    theta = -90:1:90;
   
    %H=zeros(728,180);
    H=zeros(1707,181);
    for i=1:size(BW,1)
      for j=1:size(BW,2)
        
        if BW(i,j)>0
          for idx = 1:length(theta)
            
          d= i*cos(theta(idx)*pi/180)+j*sin(theta(idx)*pi/180);
          d=round(d);
          
          %H(d+364,(theta(idx)+91))=H(d+364,(theta(idx)+91))+1;
         H(d+854,(theta(idx)+91))=H(d+854,(theta(idx)+91))+1;
          endfor
        endif
        
        
      endfor
    endfor
    
     mesh(theta_mesh,rho,H)
    %% TODO: Your code here
endfunction
