** Problem 2, tut 4, week 9
Integer variables x1,x2;
Free variable z;

equations of, eq1, eq2, eq3;

of..    z =e= -3*x1 + 5*x2;
eq1..   5*x1 - 7*x2 =g= 3;
eq2..   x1 =l= 3;
eq3..   x2 =l= 3;

Model mip1 /all/;

Solve mip1 using MIP maximizing z;