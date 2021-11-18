function DriveMotor(goalPos)
    port_num = evalin('base','port_num');
    PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');
    MX28_GOAL_POSITION = evalin('base','MX28_GOAL_POSITION');
    MX28_ID = evalin('base','MX28_ID');
    
    numServo = length(MX28_ID);
    
    for i = 1:numServo
        if goalPos(i) > 4096 | goalPos(i) < 0
            warning('Wrong Input at %d Servo\n',i);
        end
    end

    for i = 1:numServo
        write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(goalPos(i)), 'uint32'));
    end