clear

msg = '<ding yalei><ydin0002@student.monash.edu>';

msg_h = dec2hex(msg);
msg_h = msg_h(:);

msg_b = dec2bin(msg);
msg_b = msg_b(:);

msg_bn = (msg_b - '0');

disp(msg);
disp(msg_h);
disp(msg_b);
disp(msg_bn);


%02
[a, b] = size(msg_b);
c = (int32(a / 24) - 1) * 24;
d = int32(a / 24);
disp(size(msg_b));
e = ones(c + 24 - a);
msg_b = [msg_b; e];

msg_24 = reshape(msg_b, d, 24);

disp(msg_24);
