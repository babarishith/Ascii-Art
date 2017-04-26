% Load an image
I = imread('businessCard.png');

% Perform OCR
results = ocr(I);

% Display one of the recognized words
word = results.Words{2}

% Location of the word in I
wordBBox = results.WordBoundingBoxes(2,:)