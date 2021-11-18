function theta = readServoPos()
port_num = evalin('base','port_num');
PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');
MX28_ID = evalin('base','MX28_ID');
MX28_PRESENT_POSITION = evalin('base','MX28_PRESENT_POSITION');

numServo = length(MX28_ID);
theta = zeros(numServo,1);

for i = 1:numServo
        % Read present position
        theta(i) = read4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_PRESENT_POSITION);
end