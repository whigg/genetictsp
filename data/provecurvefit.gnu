clear
set terminal png size 800,600 font 'Verdana, 14'
set term png
set key left

set output 'curvefit_time_itr.png' 
set title 'Fitting Number of Iterations vs. Runtime' 
set xlabel 'Number of Iterations'
set ylabel 'Runtime (seconds)'
f1(x) = a*x + b
a = 1; b = 1;
fit f1(x) 'par_12_itr_time.dat' using ($1):($2/1000) via a,b
plot 'par_12_itr_time.dat' using 1:($2/1000) w l title '12 Threads', f1(x) title 'Curve Fit'

set output 'curvefit_time_cit.png' 
set title 'Fitting Number of Cities vs. Runtime' 
set xlabel 'Number of Cities'
set ylabel 'Runtime (seconds)'
f2(x) = a*(x**2 + b) + c
a = 1; b = 1; c = 1;
fit f2(x) 'par_12_cit_time.dat' using 1:($2/1000) via a,b,c
plot 'par_12_cit_time.dat' using 1:($2/1000) w l title '12 Threads', f2(x) title 'Curve Fit'

set output 'curvefit_time_pop.png' 
set title 'Fitting Number of Population Size vs. Runtime' 
set xlabel 'Population Size'
set ylabel 'Runtime (seconds)'
f3(x) = a*x + b
a = 1; b = 1;
fit f3(x) 'par_12_pop_time.dat' using 1:($2/1000) via a,b
plot 'par_12_pop_time.dat' using 1:($2/1000) w l title '12 Threads', f3(x) title 'Curve Fit'
