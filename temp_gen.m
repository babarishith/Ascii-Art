function [I, Res] = temp_gen() 
    T = load('templates');
    Temp = T.templates;
    ze = zeros(5,5);
    h = ze;
    v = ze;
    h(3,:) = 1;
    v(:,3) = 1;
    d = diag(ones(1,5));
    od = strel('line', 7, 45);
    od = uint8(od.getnhood());
    vl= Temp{22};
    e = vl(42:-1:1, 24:-1:1);
    fl = zeros(9,9);
    fl(5,:) = 1;
    fl(5,5) = 0;
    fr = fl;
    fr(5,6) = 1;
    fl(5,4) = 1;
    fr(1, 3:4) = 1;
    fr(9,3:4) = 1;
    fl(1,6:7) = 1;
    fl(9,6:7) = 1;
    eeq = ze;
    eeq(2,1:5) = 1;
    eeq(4,1:5) =1;
    emp = ze;
    ver = zeros(3,3);
    I = {emp, h,v,eeq,od,d,e',vl',fl,fr};
    j = 11;
    Res = [' ','-','|','=','/','\' ,'<','>','{','}','C','c', 'E', 'F', 'H', 'L', 'O', 'o', 'T', 'U', 'V', 'W', 'Y'];
    for i = [3, 29, 5, 6, 8, 12, 15, 41, 20, 21, 22, 23, 25]
        I{j} = Temp{i};
        j = j+1;
    end
    s =size(I);
    for i = 1:s(2)
        bis = imresize(I{i}, [42, 24]);
        I{i} = uint8(bis);
    end
end