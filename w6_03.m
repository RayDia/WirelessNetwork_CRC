clear

msg = '<ding yalei><ydin0002@student.monash.edu>';

msg_h = dec2hex(msg);
msg_h = msg_h(:);

msg_b = dec2bin(msg);
msg_b = msg_b(:);

msg_bn = uint8(msg_b - '0');


g(33 : -1 : 1) = [1, 0 0 0 0 0 1 0 0, 1 1 0 0 0 0 0 1, 0 0 0 1 1 1 0 1, 1 0 1 1 0 1 1 1];

d = msg_bn';
[sizea, sizeb] = size(d);

for i = sizea : -1 : 33
    if d(i) == 1
        d(i : -1 : i - 32) = xor(d(i : -1 : i - 32), g(33 : -1 : 1));
    end
end
crc = d(32 : -1 : 1);
crc = crc(32 : -1 : 1);
crc = crc(:);

crcd4 = int64(0);

for i = 1 : size(crc)
    crcd4 = crcd4 * 2 + int64(crc(i, 1));
end

crch7 = dec2hex(crcd4);