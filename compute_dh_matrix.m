% Write a function named compute_dh_matrix that returns the 4-by-4 homogeneous transformation matrix using the Denavit-Hartenberg convention. The function definition is provided
% Input Format
% r - the length of the common normal
% alpha - angle about common normal from old z to new z
% d - offset along previous z to the common normal
% theta - angle about previous z, from old x to new x
% Output Format
% 4x4 matrix representing the transformation

function A = compute_dh_matrix(r, alpha, d, theta)

    A = eye(4);
    A = [cos(theta) -sin(theta)*cos(alpha), sin(theta)*sin(alpha), r*cos(theta);
     sin(theta) cos(theta)*cos(alpha), -cos(theta)*sin(alpha), r*sin(theta);
     0, sin(alpha), cos(alpha), d;
     0, 0, 0, 1];
    
end