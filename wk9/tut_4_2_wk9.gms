** Problem 3, tut 4, week 9
Integer variables x1,x2;
Free variable z;

equations of, eq1, eq2;

of..    z =e= 2*x1 + 3*x2;
eq1..   x1 + x2 =g= 3;
eq2..   x1 + 3*x2 =g= 6;

Model mip2 /all/;

Solve mip2 using MIP minimizing z;