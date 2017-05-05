%Q3
clear
% initial data
msg = '<ding yalei><ydin0002@student.monash.edu>';

msg_h = dec2hex(msg);
msg_h = msg_h(:);

msg_b = dec2bin(msg);
msg_b = msg_b(:);

msg_bn = uint8(msg_b - '0');

%cal
bits = dec2bin(msg) - '0';
%crc 
poly = [1 de2bi(hex2dec('EDB88320'), 32)]';
bits = bits(:);

bits(1:32) = 1 - bits(1:32);% flip first 32 bits
bits = [bits; zeros(32,1)];

rem = zeros(32,1);%remainder to 0
for i = 1:length(bits)
    rem = [rem; bits(i)]; 
    if rem(1) == 1
        rem = bitxor(uint8(rem), uint8(poly)); % mod(rem + poly, 2)
    end
    rem = rem(2:33);
end


ret = 1 - rem;% flip the remainder
%ret = rem;

crcans1 = ret;
c1 =crcans1;

%remainer to hex
for i = 1 : 8
    a = c1(i * 4 - 3 : i * 4, 1)';
    temp = dec2hex(bin2dec(num2str(a)));
    %disp(temp);
    crch1(i, 1) = temp;
end
crch1 = crch1';
disp(crch1);

%Q4
temp = (dec2bin(msg) - '0');
temp = temp(:);
dat = [uint8(temp); uint8(crcans1)];
%crc 
bits = dat;
poly = [1 de2bi(hex2dec('EDB88320'), 32)]';
bits = bits(:);

bits(1:32) = 1 - bits(1:32);% flip first 32 bits
bits = [bits; zeros(32,1)];

rem = zeros(32,1);%remainder to 0
for i = 1:length(bits)
    rem = [rem; bits(i)]; 
    if rem(1) == 1
        rem = bitxor(uint8(rem), uint8(poly)); % mod(rem + poly, 2)
    end
    rem = rem(2:33);
end

crcans2 = rem;

c2 = crcans2;
crch2 = num2str(zeros(8, 1));
% to hex
for i = 1 : 8
    a = c2(i * 4 - 3 : i * 4, 1)';
    temp = dec2hex(bin2dec(num2str(a)));
    %disp(temp);
    crch2(i, 1) = temp;
end
crch2 = crch2';
disp(crch2);


%Q5
bits = dat;
bits(319, 1) = 0; 
%bits(7, 1) = 1; remainer is still C704DD7B
poly = [1 de2bi(hex2dec('EDB88320'), 32)]';
bits = bits(:);

bits(1:32) = 1 - bits(1:32);% flip first 32 bits
bits = [bits; zeros(32,1)];

rem = zeros(32,1);%remainder to 0
for i = 1:length(bits)
    rem = [rem; bits(i)]; 
    if rem(1) == 1
        rem = bitxor(uint8(rem), uint8(poly)); % mod(rem + poly, 2)
    end
    rem = rem(2:33);
end

crcans3 = rem;

c3 = crcans3;
crch3 = num2str(zeros(8, 1));
% to hex
for i = 1 : 8
    a = c3(i * 4 - 3 : i * 4, 1)';
    temp = dec2hex(bin2dec(num2str(a)));
    crch3(i, 1) = temp;
end
crch3 = crch3';
disp(crch3);


