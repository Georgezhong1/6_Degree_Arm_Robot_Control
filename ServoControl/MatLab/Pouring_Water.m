% MAE C263A Project
% Team 14
initialize();

goalPos = zeros(length(MX28_ID),1);
currPos = zeros(length(MX28_ID),1);

% initialize Position
input('Press any key to initialPos!');
DriveMotor(initialPos);

% Read Servo Position
%input('Press any key to Read Position!');
%currPos = readServoPos();

% goal Position
%input('Press any key to Go to Goal Pos');
%goalPos = FKCAl();
DriveMotor([1080 2048 2048 3000 2548 1320]);
input('Press any key to Go to Next Position');

% Rase wrist
DriveMotor([1080 2048 3000 1195 2548 1320]);
input('Press any key to Go to Next Position');
pause(1)

%low down to 1st target
DriveMotor([1581 2048 3000 1195 2548 1320]);   
%input('Press any key to Go to Next Position');
pause(1)

%low down to 1st target
DriveMotor([1581 1591 3000 1500 2519 1320]);   
input('Press any key to Go to Next Position');
pause(1)
EndEffector(1);

%Lifting
DriveMotor([1581 2512 3000 2400 2569 1320]);   
input('Press any key to Go to Next Position');
pause(1)


%Lifting
DriveMotor([1000 2512 3000 2400 2569 1320]);   
input('Press any key to Go to Next Position');
pause(1)


%Pouring
DriveMotor([1000 2512 3000 2400 2569 200]);   
input('Press any key to Go to Next Position');
pause(3)

%Lifting
DriveMotor([1000 2512 3000 2400 2569 1320]);   
input('Press any key to Go to Next Position');
pause(1)

% Returning Body
DriveMotor([1581 2512 3000 2000 2569 1320]);   
input('Press any key to Go to Next Position');
pause(1)

%return to 1st target
DriveMotor([1581 1591 3000 1500 2519 1320]);   
input('Press any key to Go to Next Position');
pause(1)
EndEffector(0);

%retreating
DriveMotor([1500 2608 3000 2827 2483 1320]);   
input('Press any key to Go to Next Position');
pause(1)
EndEffector(0);

DriveMotor(initialPos);

pause(0.5);
EndEffector(1);
pause(0.5);
EndEffector(0);
pause(0.5);
EndEffector(1);
pause(0.5);
EndEffector(0);
pause(0.5);
EndEffector(1);
pause(0.5);
EndEffector(0);
pause(0.5);
EndEffector(1);
pause(0.5);
EndEffector(0);
pause(0.5);
EndEffector(1);
pause(0.5);
EndEffector(0);
pause(0.5);

% Main
%Theta1 = theta1/2/pi*4096; % Motor angle 0-4095; You may also need to consider the offset, i.e., when theta1 = 0, Theta1 ~= 0.

% Move MX28_ID(1) to Theta1 angle
%write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(Theta1), 'uint32'));


% Terminate
input('Press any key to terminate!');
terminate();