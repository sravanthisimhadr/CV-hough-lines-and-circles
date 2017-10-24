% ps1
pkg load image;  % Octave only

%% 1-a
img = imread(fullfile('input', 'ps1-input3.png'));  % already grayscale
%% TODO: Compute edge image img_edges
img=rgb2gray(img);
img = imsmooth (img, "Custom Gaussian", 30 , 30);
%imf = uint8(zeros(size(img)));
%for i = 0:3
%  imf += imfilter(img, rot90(fspecial("sobel"), i));
%end
%imshow(imf)
img_edges=img;
img_edges=edge (img, "Canny", 0.5, 2);
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png
imshow(img_edges);


%% 2-a
[H1, theta, rho] = hough_lines_acc(img_edges,1);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
imwrite(H1, fullfile('output', 'ps1-2-a-1.png'));  % save as output/ps1-1-a-1.png
          %H2=houghtf(img_edges);
          %plot(H1-H2);
          %mesh(theta,rho,H2)
%% 2-b
peaks = hough_peaks(H1, 20);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
out_file=img;
hough_lines_draw(img,out_file,peaks,rho,theta);
%% TODO: Rest of your code here
