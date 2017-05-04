%Q3
clear

msg = '<ding yalei><ydin0002@student.monash.edu>';

msg_h = dec2hex(msg);
msg_h = msg_h(:);

msg_b = dec2bin(msg);
msg_b = msg_b(:);

msg_bn = uint8(msg_b - '0');


g(33 : -1 : 1) = [1, 0 0 0 0 0 1 0 0, 1 1 0 0 0 0 0 1, 0 0 0 1 1 1 0 1, 1 0 1 1 0 1 1 1];
g = g(33 : -1 : 1);
g = g(:);
d = msg_bn;
[sizeg, t] = size(g);
c = zeros(sizeg - 1, 1);

for i = 1 : (size(d) - sizeg + 2)
    disp(d');
    temp = bitxor(uint8(g), d(1 : sizeg, 1));
    
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

crc = [c(2 : sizeg - 1, 1); 0];







crcd5 = int64(0);
c5 = c(size(c) : -1 : 1);

for i = 1 : size(c5)
    crcd5 = crcd5 * 2 + int64(c5(i, 1));
end

crch5 = dec2hex(crcd5);
