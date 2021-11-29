function EndEffector(status)
	%{
	1.Check current end effector status 
	2.Compare current status with goal position 
	3.Comparision: 
		1. The same: Do nothing 
		2. Different: change servo status
	%}
	port_num = evalin('base','port_num');
    PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');
    XL320_GOAL_POSITION = evalin('base','XL320_GOAL_POSITION');
    XL320_ID = evalin('base','XL320_ID');
    XL320_PRESENT_POSITION = evalin('base', 'XL320_PRESENT_POSITION')
    PROTOCOL_VERSION = evalin('base','PROTOCOL_VERSION');

	% Set up Grap and unleash 	
	% The Parameter need to be tested
    grap_status = 450;
    unleash_status = 768;
       
	% Set up the goal status 
    current_status = 0; 
	goal_status = 0;
    if status == 1 
        goal_status = grap_status
    else
        goal_status = unleash_status
	end
		
	% Reading Current Status
    current_status = read4ByteTxRx(port_num, PROTOCOL_VERSION, XL320_ID(1), XL320_PRESENT_POSITION);
	
	% If the grap status need to be changed
	%if current_status ~= goal_status
		write4ByteTxRx(port_num, PROTOCOL_VERSION, XL320_ID(1), XL320_GOAL_POSITION,goal_status); 	
    %end	

    

