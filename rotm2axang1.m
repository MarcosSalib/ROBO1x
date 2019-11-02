% In this function, you need to convert the rotation matrix R into axis-angle form

% More illusration about how the singularities work:
% https://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToAngle/index.htm

function [axang] = rotm2axang1(R)
 
    %% Your code starts here
    vec = [0 0 0];
    theta = 0;
    
    theta = acos((trace(R)-1)/2);
    if theta == 0
        vec = [NaN, NaN, NaN];
        axang = [NaN, NaN, NaN, theta]
    elseif theta==pi
        %% abs(R(1,2)+R(2,1)) < 0.001 && abs(R(1,3)+R(3,1)) < 0.001 && abs(R(2,3)+R(3,2)) < 0.001
        theta=pi; theta_=[theta; theta]
        if (R(1,1)>R(2,2)) && (R(1,1)>R(3,3))
            x = sqrt((R(1,1)+1)/2);
            y = R(1,2)/(2*x);
            z = R(1,3)/(2*x);
            vec_ = [x, y, z; -x, -y, -z];
            axang = horzcat(vec_, theta_)
        elseif (R(2,2)>R(1,1)) && (R(2,2)>R(3,3))
            y = sqrt((R(2,2)+1)/2);
            x = R(2,1)/(2*y);
            z = R(2,3)/(2*y);
            vec_ = [x, y, z; -x, -y, -z];
            axang = horzcat(vec_, theta_)
        else
            z = sqrt((R(3,3)+1)/2);
            x = R(3,1)/(2*z);
            y = R(3,2)/(2*z);
            vec_ = [x, y, z; -x, -y, -z];
            axang = horzcat(vec_, theta_)
        end
    else
        vec = (1/(2*sin(theta)))*[R(3,2)-R(2,3), R(1,3)-R(3,1), R(2,1)-R(1,2)];
        axang = [vec, theta]
    end
    
    %% Your code ends here

end