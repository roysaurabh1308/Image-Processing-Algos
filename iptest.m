%faceDetector = vision.CascadeObjectDetector();
c=urlread('http://192.168.43.1:8080/shot.jpg');
j=imread(c);
imshow(j);