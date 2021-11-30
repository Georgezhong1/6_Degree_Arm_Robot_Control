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
DriveMotor([1080 2048 3000 2048 2548 1320]);
input('Press any key to Go to Next Position');

% Rase wrist
DriveMotor([1080 2048 3000 1195 2548 1320]);
%low down to 1st target
DriveMotor([500 1525 3000 1525 2548 1320]);   
%input('Press any key to Go to Next Position');
pause(1)
EndEffector(1);


%input('Press any key to Go to Next Position');
%rise up
DriveMotor([500 2048 3000 1195 2548 1320]);

%Body Twrist
%input('Press any key to Go to Next Position');
DriveMotor([1080 2048 3000 1195 2548 1320]);
EndEffector(1);
pause(0.5);

%lower down
%input('Press any key to Go to Next Position');
DriveMotor([1080 1525 3000 1525 2548 1320]);
pause(1);
EndEffector(0);

%rise up after placing
%input('Press any key to Go to Next Position');
DriveMotor([1080 2048 3000 1195 2548 1320]);

%Twist Body
%input('Press any key to Go to Next Position');
DriveMotor([1800 2048 3000 1195 2548 1320]);

% to 2nd target
%input('Press any key to Go to Next Position');
DriveMotor([1800 1525 3000 1525 2548 1320]);
%input('Press any key to Go to Next Position');
pause(1)
EndEffector(1);

%rise up 2nd
DriveMotor([1800 2048 3000 1195 2548 1320]);

% To goal Position
DriveMotor([1080 1500 3000 1400 2548 1320]);
pause(1);
EndEffector(0);

pause(0.5)
%input('Press any key to Go to Celebrate');
DriveMotor([1080 2048 3000 1400 2548 1320]);
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