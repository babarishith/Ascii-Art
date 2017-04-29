function hist = aiss(img, xc, yc)
im = imresize(img, [42,42]);
im = padarray(im, [21,21]);
rmin =0;
rmax=21;
nr = 5;
nw = 12;
k = nw/2*pi;

data = struct('rmin', rmin, 'rmax', rmax, 'nr', nr, 'nw', nw, 'k',k);
t = maketform('custom', 2,2, @forward, @inverse, data);

function [x,y] = forward(u,t)
td = t.tdata;
[th, p] = cart2pol(u(:,1), u(:, 2));
p(~p) = td.rmin/2;         
[x,y] = [td.k * log(p/td.rmin),  td.nw*mod(th/(2*pi), 1)];
end

function u = inverse(x, t)
td = t.tdata;
p = td.rmin * exp(x(:, 1)/td.k);
th = (2*pi/td.nw) * x(:, 2);
[x, y] = pol2cart(th, p);
u = [x, y];
end

Udata = [1, 42] - xc;
Vdata = [1, 42] - yc;
Xdata = [0, nr-1];
Ydata = [0, nw-1];
Size = [nw, nr];
log_img = imtransform(img, t, 'Udata', Udata, 'Vdata', Vdata, 'Xdata', Xdata, 'Ydata', Ydata, 'Size', Size);
hist = imhist(log_img);
end
