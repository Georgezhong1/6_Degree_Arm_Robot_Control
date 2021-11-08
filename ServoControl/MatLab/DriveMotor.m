% MAE C263A Project
% Team 14
function m = DriveMotor (theta1, theta2, theta3, theta4, theta5, theta6)
initialize();
angle = [theta1, theta2, theta3, theta4, theta5, theta6];

angleturns = round(angle./(2*pi())*4096);

for i = 1:6
    write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(i), MX28_GOAL_POSITION, typecast(int32(angleturns(i)), 'uint32'));
end

input('Press any key to terminate!');
terminate();