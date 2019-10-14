%%  In this part, we'll practice generating a random rotation matrix and plot
%%  another random vector before and after being rotated by this matrix. In the
%%  code box below, we have already create a starter code to plot the x, y, z axes
%%  in red, green and blue respectively, following the convention in the robotics
%%  community. You should read the starter code carefully as it will guide you on
%%  how to plot in 3D. Your task is to add the following features to the code:

%%  Generate a random matrix R that satisfy the requirements for rotation matrices.
%%  Apply the rotation represented by the rotation matrix R you randomly genereated
%%  to the vector u we generated radomly for you, and call the new rotated vector v.
%%  Plot the two vectors u and v using the function plot3(). Both vectors should
%%  originate from the frame origin.
%%  Put a textbox around the tip of the vector showing the coordinates of the
%%  vector, num2str() function should be helpful when creating the string to be
%%  displayed.
%%  If you write your script correctly, you should be able to generate a plot like
%%  the following (as the vectors are randomly generated, your plot might look
%%  slightly different)


% rand(3,1) generates a random 3 by one column vector. We use this u to plot
u=rand(3,1)*2-1;

% plot the origin
plot3(0,0,0,'.k')

% axis setting
axis vis3d
axis off
hold on
%%%%% your code starts here %%%%%
% generate a random rotation matrix R

% R = quat2rotm(quaternion(rand(1,4)))

theta = rand(1,1) * 2 * pi-pi;
x = rand(3,1) * 2-1;
y = x / (sqrt(x(1)^2 + x(2)^2 + x(3)^2));
J=[0 -y(3) y(2);y(3) 0 -y(1);-y(2) y(1) 0];
R=eye(3) + sin(theta) * J + (1-cos(theta)) * (J^2);
% plot the x axis 
plot3([0,1],[0,0],[0,0],'r');
text(1,0,0,'x')
hold on

% plot the y axis 
plot3([0,0],[0,1],[0,0],'g');
text(0,1,0,'y')
hold on

% plot the z axis 
plot3([0,0],[0,0],[0,1],'b');
text(0,0,1,'z')
hold on

% plot the original vector u
plot3([0,u(1)], [0,u(2)], [0,u(3)] , ':k')
text(u(1), u(2), u(3),['(',num2str(u(1),'%.3f'),',',num2str(u(2),'%.3f'),',',num2str(u(3),'%.3f'),')'])
hold on

% apply rotation and calcuate v plot the vector after rotation v
v = R * u;

% plot the new vector v
plot3([0,v(1)], [0,v(2)], [0,v(3)], '--k')
text(v(1), v(2), v(3), ['(',num2str(v(1),'%.3f'),',',num2str(v(2),'%.3f'),',',num2str(v(3),'%.3f'),')'])
hold on

%%%%% your code ends here %%%%%
