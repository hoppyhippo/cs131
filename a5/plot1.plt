set boxwidth 0.5 relative
set style fill solid 1.0 
set style data histograms 

set terminal svg size 3000,768
set datafile separator ' '

set terminal svg
set out 'plot1.svg'

set title "Large Spot Sizes by Area"
set xlabel "Large Spot Sizes"
set ylabel "Area"

set yrange[0:3]

plot 'flare.data1' using 10:xtic(2) with boxes lc rgb 'green' title "large spots"

