%Hough Transform to find lines
pkg load image;

%Load an Image and Convert to Grayscale to apply canny Filter
im = imread('C:\Users\HP\Desktop\GoruntuIsleme\yesil.jpg');
im_gray = rgb2gray(im);
im_edge = edge(im_gray, 'sobel');

figure 1, imshow(im),      title('Original Image');
figure 2, imshow(im_gray), title('Grayscale Image');
figure 3, imshow(im_edge), title('Canny Filter Edge');

%Apply Hough Transform to Find the Candidate Lines
accum       = houghtf(im_edge);
theta       = -90:90;
diag_length = (size(accum)(1) - 1) / 2;
rho         = -diag_length:diag_length;
figure 4, imagesc(theta, rho, accum), title('Hough Accumulator');

peaks = houghpeaks(accum, 100, 'Threshold', ceil(0.6 * max(accum(:))), 'NHoodSize', [5,5]);

%Finding the line segments in the image
line_segs = houghlines(im_edge, theta, rho, peaks, 'FillGap', 50, 'MinLength', 100);

%Plotting
figure 5, imshow(im), title('Line Segments');
hold on;
for k=1:length(line_segs)
    endpoints = [line_segs(k).point1; line_segs(k).point2];
    plot(endpoints(:,1), endpoints(:,2), 'LineWidth', 2, 'Color', 'green');
end
hold off;