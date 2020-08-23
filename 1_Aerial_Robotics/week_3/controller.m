function [ u1, u2 ] = controller(~, state, des_state, params)
%CONTROLLER  Controller for the planar quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [y; z], state.vel = [y_dot; z_dot], state.rot = [phi],
%   state.omega = [phi_dot]
%
%   des_state: The desired states are:
%   des_state.pos = [y; z], des_state.vel = [y_dot; z_dot], des_state.acc =
%   [y_ddot; z_ddot]
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls

u1 = 0;
u2 = 0;

% FILL IN YOUR CODE HERE
kp_y = 10;
kv_y = 10;
kp_z = 200;
kv_z = 150;
kp_phi = 500;
kv_phi = 80;

phi_c = (-1/params.gravity)*(des_state.acc(1) + kv_y*(des_state.vel(1)-state.vel(1)) + kp_y*(des_state.pos(1)-state.pos(1)));
u1 = params.mass*(params.gravity + des_state.acc(2) + kv_z*(des_state.vel(2)-state.vel(2)) + kp_z*(des_state.pos(2)-state.pos(2)));
u2 = params.Ixx*(kv_phi*(-state.omega) + kp_phi*(phi_c-state.rot));

end
