set style fill transparent solid 0.2 noborder

set datafile separator ' '

set terminal svg
set out 'plot2.svg'

set title "Evolution from Activity" 
set xlabel "Activity" 

NO_ANIMATION = 1
set xrange [-1:3]
set yrange [0:5]

plot 'flare.data2' using 4:5 with circles lc rgb 'red'

