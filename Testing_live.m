clc
close all
faceDetector = vision.CascadeObjectDetector();
figure
 T = timer('TimerFcn',@(~,~)disp('Fired.'),'StartDelay',1);
 
 
for i=1:80
    start(T)
    [url_img, map] = imread('http://172.16.121.21:8080/shot.jpg');
    imshow(url_img), title('Image from url')
    bbox            = step(faceDetector, url_img);

    % Draw the returned bounding box around the detected face.
    videoFrame = insertShape(url_img, 'Rectangle', bbox);
    imshow(videoFrame); title('Detected face');


    %bboxPoints = bbox2points(bbox(1, :));
    wait(T)
end