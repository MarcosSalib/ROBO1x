%%  In this part, we will build a function that takes two quaternion  and  as input
%%  variables and calculate the product of them  as the output. We have set up the
%%  function environment for you. All you need to do is to add codes to the region
%%  between the "your code starts here" and "your code ends here".
%%  Note: Different conventions can be adopted in different contexts. Use caution if
%%  you want to use the formula from the internet.


function q=quatprod(q1,q2)
    % This is quaternions multiplication function
    % All quaternions q, q1 and q2 are represented as 1-by-4 row vectors 
    q=zeros(1,4);

    q(1)= (q1(1)*q2(1)) - (q1(2) * q2(2)) - (q1(3) * q2(3)) - (q1(4) * q2(4));
    q(2)= (q1(1)*q2(2)) + (q1(2) * q2(1)) + (q1(3) * q2(4)) - (q1(4) * q2(3));
    q(3)= (q1(1)*q2(3)) - (q1(2) * q2(4)) + (q1(3) * q2(1)) + (q1(4) * q2(2));
    q(4)= (q1(1)*q2(4)) + (q1(2) * q2(3)) - (q1(3) * q2(2)) + (q1(4) * q2(1));
end
