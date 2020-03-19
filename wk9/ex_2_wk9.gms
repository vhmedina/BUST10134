Integer variables x1i,x2i;
Free variable z;
equations ofi,eq1i,eq2i;

ofi..            z =e= 3*x1i + 4*x2i;
eq1i.. 2*x1i +   x2i =l= 6;
eq2i.. 2*x1i + 3*x2i =l= 9;

Model mip1 /ofi,eq1i,eq2i/;

Solve mip1 using MIP maximizing z;