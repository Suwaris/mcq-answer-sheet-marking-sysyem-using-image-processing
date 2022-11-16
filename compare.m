function compare()

% Read two images
pic1 = imread('reference_image.png');
pic2 = imread('std4.png');
%pic2 = imread('std2.png');
%pic2 = imread('std3.png');

% Get the difference of two images
differentiated_image = imabsdiff(pic1, pic2);

% Convert the differentiated image to bw
diffgray = rgb2gray(differentiated_image);
diffbw = im2bw(diffgray);

% Remove noise from the differentiated image
%diffmedfil = medfilt2(diffbw);

% Remove unnessacary edges from the differentiated image
sel = strel('disk', 3);
differode = imerode(diffbw, sel);

% Count the objects in differentiated image
[label count] = bwlabel(differode, 4);

% Define total number of questions
totalNumberOfQuestions = 10;

% Calculate the marks
noOfCorrectAnswers = totalNumberOfQuestions - (count/2);

% Display the result
totalNumberOfQuestions
noOfCorrectAnswers


% Display the subplot
subplot(1,3,1),imshow(pic1),title("Reference Sheet"), subplot(1,3,2),imshow(pic2),title("Answer Sheet"),subplot(1,3,3),imshow(differode),title("Differentiated Image")







