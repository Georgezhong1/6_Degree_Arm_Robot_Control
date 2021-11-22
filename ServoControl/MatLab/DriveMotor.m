function DriveMotor(goalPosD)
    port_num = evalin('base','port_num');
    PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');
    MX28_GOAL_POSITION = evalin('base','MX28_GOAL_POSITION');
    MX28_ID = evalin('base','MX28_ID');
    servoLimitD = evalin('servoLimitD');
    
    numServo = length(MX28_ID);

    servoLimitStep = interp1([-180,180],[0,4096],servoLimitD);
    
    for i = 1:numServo
        if goalPosD(i) > servoLimitStep(i,2) || goalPosD(i) < servoLimitStep(i,1)
            warning('Wrong Input at %d Servo\n',i);
        end
    end

    for i = 1:numServo
        write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(goalPos(i)), 'uint32'));
    end