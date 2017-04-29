dataset_load();
im = imread('cindrella.jpg');
im = proc(im);
x = 58;
y = 88;
w = 5;
siz = size(im);
fileID = fopen('art.txt','w');
[ASC, Res] = temp_gen();
for x=1:floor(siz(1)/w -1)
    for y=1:floor(siz(2)/w -1)
        nose = im(w*x:w*x+w-1,w*y:w*y+w-1);
        nose = uint8(nose);
        ind = match(nose, ASC);
        s = Res(ind);
        fprintf(fileID, '%s', s);
    end
    fprintf(fileID, '\n');
end
% imshow(im);