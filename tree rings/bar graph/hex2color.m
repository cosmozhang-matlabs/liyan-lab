function [ color ] = hex2color( hex_str )

if size(hex_str, 2) == 6
    r = hex_str(1:2);
    g = hex_str(3:4);
    b = hex_str(5:6);
    base = 256;
elseif size(hex_str, 2) == 3
    r = hex_str(1);
    g = hex_str(2);
    b = hex_str(3);
    base = 16;
else
    throw(MException('hex_str:InvalidLength', 'Hex string not valid'));
end

base = base - 1;

color = [hex2dec(r)/base , hex2dec(g)/base , hex2dec(b)/base];

end

