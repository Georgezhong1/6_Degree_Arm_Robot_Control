% MAE C263A Project
% Team 14
initialize();

goalPos = zeros(length(MX28_ID),1);
currPos = zeros(length(MX28_ID),1);

% initialize Position
input('Press any key to initialPos!');
DriveMotor(initialPos);

% Read Servo Position
input('Press any key to Read Position!');
currPos = readServoPos()

% goal Position
input('Press any key to Go to Goal Pos');
goalPos = FKCAl();
DriveMotor(goalPos);

% Main
%Theta1 = theta1/2/pi*4096; % Motor angle 0-4095; You may also need to consider the offset, i.e., when theta1 = 0, Theta1 ~= 0.

% Move MX28_ID(1) to Theta1 angle
%write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(Theta1), 'uint32'));


% Terminate
input('Press any key to terminate!');
terminate();