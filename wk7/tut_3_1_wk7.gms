Set
   i 'product class' / class-1*class-4 /
   j 'workstation'   / work-1*work-2   /
   s 'nodes'         / s1*s100 /;

Parameter
   c(i)     'profit' / class-1 12, class-2 20, class-3 18, class-4 40 /
   q(j)     'cost'   / work-1 5, work-2 10 /
   h(j,s)   'available labor'
   t(j,i,s) 'labor required';

Table trand(j,*,i) 'min and max values'
                class-1  class-2  class-3  class-4
   work-1.min       3.5      8        6          9
   work-1.max       4.5     10        8         11
   work-2.min        .8       .8      2.5       36
   work-2.max       1.2      1.2      3.5       44;

t(j,i,s) = uniform(trand(j,'min',i),trand(j,'max',i));

h('work-1',s) = normal(6000,100);
h('work-2',s) = normal(4000, 50);

Variable
   eprofit 'expected profit'
   x(i)    'products sold'
   v(j,s)  'labor purchased';

Positive Variable x, v;

Equation
   obj       'expected cost definition'
   lbal(j,s) 'labor balance';

obj.. eprofit =e= sum(i, c(i)*x(i)) - 1/card(s)*sum((j,s), q(j)*v(j,s));

lbal(j,s).. sum(i, t(j,i,s)*x(i)) =l= h(j,s) + v(j,s);

Model mix / all /;

solve mix using lp maximizing eprofit;

display eprofit.l, x.l;