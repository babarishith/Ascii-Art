function ind = match(img, I)
    imb = imresize(img, [42,24]);
    s = size(I);
    sim = zeros(s);
    sim(1) = ssim(imb, I{1});
    if sim(1) == 1
        ind = 1;
        return
    end
    for i = 2:s(2)
        sim(i) = ssim(imb, I{i});
    end
    [val, ind] = max(sim(2:end));
    ind = ind + 1;
end