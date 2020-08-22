function [ u ] = pd_controller(~, s, s_des, params)
%PD_CONTROLLER  PD controller for the height
%
%   s: 2x1 vector containing the current state [z; v_z]
%   s_des: 2x1 vector containing desired state [z; v_z]
%   params: robot parameters

u = 0;


% FILL IN YOUR CODE HERE

e = s_des - s;
Kp = 110;
Kv = 15;
u = params.mass * (Kp*e(1) + Kv*e(2) + params.gravity);

end

