function [im] = proc(im)
im = rgb2gray(im);
ed = edge(im);
ed = imdilate(ed,strel('disk',2));
im = bwmorph(ed,'thin',inf);
end
