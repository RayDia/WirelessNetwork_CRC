msg = bin2dec('1010001101');
msg = dec2bin(msg);
g = bin2dec('110101');
g = dec2bin(g);
g = uint8(g - '0')';

d = uint8(msg - '0')';

c = zeros(5, 1);

sizeg = size(g);

for i = 1 : (size(d) - sizeg + 2)
    disp(d');
    temp = bitxor(g, d(1 : sizeg, 1));
    
    c = temp(2 : sizeg, 1);
    disp(temp');
    check1 = find(temp, 1, 'first');
    %shl
    if(size(check1) == 1)
        dd = [temp(check1 : sizeg, 1); d(sizeg + 1 : size(d), 1);  zeros(check1 - 1, 1)];
    else
        dd =  [ d(sizrg + 1 :  size(msg), 1);  zeros(sizeg, 1)];
    end
    d = dd;
    if check1 > 1
        i = i + check1 - 1;
    end
end

crc = [c(2 : sizeg); 0];
