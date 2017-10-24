function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
     imshow (img);
  hold ("on");  
    
%hold ("on"); 
for(idx=1:length(peaks))

   x=(peaks(idx,1))/cos((peaks(idx,2))*pi/180);
   y=(peaks(idx,1))/sin((peaks(idx,2))*pi/180);
   if(x<0)
   x1 = size(img,1);
   y1 = (x1+abs(x))*y/abs(x);
   P1=[x1 y1];
   P2=[0 y];
   axis([0 683 0 512])
   
   line(P1,P2,'color', 'm', 'linewidth', 2);
   else
   
   X=[x 0];
   Y=[0 y];
  axis([0 683 0 512])

   line(Y,X,'color', 'm', 'linewidth', 2);
   endif
   
   
 endfor
    

   

saveas (1, "figure1.png");
hold ("off");
endfunction
