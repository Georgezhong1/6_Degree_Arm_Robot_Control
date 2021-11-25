function DriveMotor(goalPosD)
    port_num = evalin('base','port_num');
    PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');
    MX28_GOAL_POSITION = evalin('base','MX28_GOAL_POSITION');
    MX28_ID = evalin('base','MX28_ID');
    servoLimitD = evalin('base','servoLimitD');
    initialPos = evalin('base','initialPos');
    MX28_PRESENT_VELOCITY = evalin('base','MX28_PRESENT_VELOCITY');
    numServo = length(MX28_ID);


    
    servoLimitStep = interp1([-180,180],[0,4096],servoLimitD);
    servoLimitMin = initialPos - servoLimitStep(1)
    servoLimitMax = initialPos + servoLimitStep(2)
    
    for i = 1:numServo
        if goalPosD(i) > servoLimitMax(i) || goalPosD(i) < servoLimitMin(i)
            warning('Wrong Input at %d Servo\n',i);
        end
    end

    for i = 1:numServo
%          if goalPosD(i) > 4096
%              goalPosD(i) = goalPosD(i)-4096;
%          end
%          if goalPosD(i) < 0
%              goalPosD(i) = goalPosD(i)+4096;
%          end
        write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(goalPosD(i)), 'uint32'));

        pause(0.1);
        ii = read4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_PRESENT_VELOCITY);
        while ii > 0 
            ii = round(read4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_PRESENT_VELOCITY));
            pause(0.1);
        end
        
    end