
# base64 coverage-all
set term svg size 800,500
set output 'plots/base64-coverage-over-time.svg'
set grid
set xrange [-1:50]
set yrange [-1:50]
set xlabel 'time [s]'
set ylabel 'lines'
set title 'AFL: line coverage over time (base64)'
set xzeroaxis
set yzeroaxis
set key box bottom
plot 'data/base64/afl-out-wo-trace-covtime-all.dat' u 1:2 w l t 'normal', 'data/base64/afl-out-trace-covtime-all.dat' u 1:2 w l t 'trace', 'data/base64/afl-out-ASAN-wo-trace-covtime-all.dat' u 1:2 w l t 'ASAN', 'data/base64/afl-out-ASAN-covtime-all.dat' u 1:2 w l t 'ASAN + trace', 'data/base64/afl-out-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'normal (quick+dirty mode)', 'data/base64/afl-out-trace-dump-covtime-all.dat' u 1:2 w l t 'trace (quick+dirty mode)', 'data/base64/afl-out-ASAN-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'ASAN (quick+dirty mode)', 'data/base64/afl-out-ASAN-dump-covtime-all.dat' u 1:2 w l t 'ASAN + trace (quick+dirty mode)'

# md5sum coverage-all
set term svg size 800,500
set output 'plots/md5sum-coverage-over-time.svg'
set grid
set xrange [-10000:600000]
set yrange [-10:100]
set xlabel 'time [s]'
set ylabel 'lines'
set title 'AFL: line coverage over time (md5sum)'
set xzeroaxis
set yzeroaxis
set key box
plot  'data/md5sum/afl-out-ASAN-wo-trace-covtime-all.dat' u 1:2 w l t 'ASAN', 'data/md5sum/afl-out-ASAN-covtime-all.dat' u 1:2 w l t 'ASAN + trace', 'data/md5sum/afl-out-ASAN-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'ASAN (quick+dirty mode)', 'data/md5sum/afl-out-ASAN-dump-covtime-all.dat' u 1:2 w l t 'ASAN + trace (quick+dirty mode)'

# uniq coverage-all
set term svg size 800,500
set output 'plots/uniq-coverage-over-time.svg'
set grid
set xrange [-1:50]
set yrange [-1:120]
set xlabel 'time [s]'
set ylabel 'lines'
set title 'AFL: line coverage over time (uniq)'
set xzeroaxis
set yzeroaxis
set key box bottom
plot 'data/uniq/afl-out-wo-trace-covtime-all.dat' u 1:2 w l t 'normal', 'data/uniq/afl-out-trace-covtime-all.dat' u 1:2 w l t 'trace', 'data/uniq/afl-out-ASAN-wo-trace-covtime-all.dat' u 1:2 w l t 'ASAN', 'data/uniq/afl-out-ASAN-covtime-all.dat' u 1:2 w l t 'ASAN + trace', 'data/uniq/afl-out-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'normal (quick+dirty mode)', 'data/uniq/afl-out-trace-dump-covtime-all.dat' u 1:2 w l t 'trace (quick+dirty mode)', 'data/uniq/afl-out-ASAN-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'ASAN (quick+dirty mode)', 'data/uniq/afl-out-ASAN-dump-covtime-all.dat' u 1:2 w l t 'ASAN + trace (quick+dirty mode)'

# who coverage-all
set term svg size 800,500
set output 'plots/who-coverage-over-time.svg'
set grid
set xrange [-10000:350000]
set yrange [-100:4200]
set xlabel 'time [s]'
set ylabel 'lines'
set title 'AFL: line coverage over time (who)'
set xzeroaxis
set yzeroaxis
set key box bottom
plot 'data/who/afl-out-wo-trace-covtime-all.dat' u 1:2 w l t 'normal', 'data/who/afl-out-trace-covtime-all.dat' u 1:2 w l t 'trace', 'data/who/afl-out-ASAN-wo-trace-covtime-all.dat' u 1:2 w l t 'ASAN', 'data/who/afl-out-ASAN-covtime-all.dat' u 1:2 w l t 'ASAN + trace', 'data/who/afl-out-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'normal (quick+dirty mode)', 'data/who/afl-out-trace-dump-covtime-all.dat' u 1:2 w l t 'trace (quick+dirty mode)', 'data/who/afl-out-ASAN-wo-trace-dump-covtime-all.dat' u 1:2 w l t 'ASAN (quick+dirty mode)', 'data/who/afl-out-ASAN-dump-covtime-all.dat' u 1:2 w l t 'ASAN + trace (quick+dirty mode)'

###############################################################################

# base64 crashes-time
set term svg size 800,500
set output 'plots/base64-crashes-over-time.svg'
set grid
set xrange [0:500000]
set yrange [0:20]
set xlabel 'time [s]'
set ylabel 'discovered crashes'
set title 'AFL: discovered crashes over time (base64)'
set xzeroaxis
set yzeroaxis
set key below box
plot 'data/base64/afl-out-wo-trace-plot_data.dat' u ($1 - 1585314929):8 w l t 'normal', 'data/base64/afl-out-trace-plot_data.dat' u ($1 - 1585315858):8 w l t 'trace', 'data/base64/afl-out-ASAN-wo-trace-plot_data.dat' u ($1 - 1585229380):8 w l t 'ASAN', 'data/base64/afl-out-ASAN-plot_data.dat' u ($1 - 1585229373):8 w l t 'ASAN + trace', 'data/base64/afl-out-wo-trace-dump-plot_data.dat' u ($1 - 1585314973):8 w l t 'normal (quick+dirty mode)', 'data/base64/afl-out-trace-dump-plot_data.dat' u ($1 - 1585314951):8 w l t 'trace (quick+dirty mode)', 'data/base64/afl-out-ASAN-wo-trace-dump-plot_data.dat' u ($1 - 1585229395):8 w l t 'ASAN (quick+dirty mode)', 'data/base64/afl-out-ASAN-dump-plot_data.dat' u ($1 - 1585229391):8 w l t 'ASAN + trace (quick+dirty mode)'
  
# md5sum crashes-time
set term svg size 800,500
set output 'plots/md5sum-crashes-over-time.svg'
set grid
set xrange [0:600000]
set yrange [0:70]
set xlabel 'time [s]'
set ylabel 'discovered crashes'
set title 'AFL: discovered crashes over time (md5sum)'
set xzeroaxis
set yzeroaxis
set key box below
plot 'data/md5sum/afl-out-ASAN-wo-trace-plot_data.dat' u ($1 - 1585229491):8 w l t 'ASAN', 'data/md5sum/afl-out-ASAN-plot_data.dat' u ($1 - 1585229487):8 w l t 'ASAN + trace', 'data/md5sum/afl-out-ASAN-wo-trace-dump-plot_data.dat' u ($1 - 1585229598):8 w l t 'ASAN (quick+dirty mode)', 'data/md5sum/afl-out-ASAN-dump-plot_data.dat' u ($1 - 1585229588):8 w l t 'ASAN + trace (quick+dirty mode)'

# uniq crashes-time
set xrange [0:450000]
set yrange [0:20]
set term svg size 800,500
set output 'plots/uniq-crashes-over-time.svg'
set grid
set xlabel 'time [s]'
set ylabel 'discovered crashes'
set title 'AFL: discovered crashes over time (uniq)'
set xzeroaxis
set yzeroaxis
set key below box
plot 'data/uniq/afl-out-wo-trace-plot_data.dat' u ($1 - 1585315027):8 w l t 'normal', 'data/uniq/afl-out-trace-plot_data.dat' u ($1 - 1585315025):8 w l t 'trace', 'data/uniq/afl-out-ASAN-wo-trace-plot_data.dat' u ($1 - 1585230546):8 w l t 'ASAN', 'data/uniq/afl-out-ASAN-plot_data.dat' u ($1 - 1585230535):8 w l t 'ASAN + trace', 'data/uniq/afl-out-wo-trace-dump-plot_data.dat' u ($1 - 1585315038):8 w l t 'normal (quick+dirty mode)', 'data/uniq/afl-out-trace-dump-plot_data.dat' u ($1 - 1585315042):8 w l t 'trace (quick+dirty mode)', 'data/uniq/afl-out-ASAN-wo-trace-dump-plot_data.dat' u ($1 - 1585230571):8 w l t 'ASAN (quick+dirty mode)', 'data/uniq/afl-out-ASAN-dump-plot_data.dat' u ($1 - 1585230569):8 w l t 'ASAN + trace (quick+dirty mode)'
  
# who crashes-time
set xrange [0:600000]
set yrange [0:100]
set term svg size 800,500
set output 'plots/who-crashes-over-time.svg'
set grid
set xlabel 'time [s]'
set ylabel 'discovered crashes'
set title 'AFL: discovered crashes over time (who)'
set xzeroaxis
set yzeroaxis
set key below box
plot 'data/who/afl-out-wo-trace-plot_data.dat' u ($1 - 1585315066):8 w l t 'normal', 'data/who/afl-out-trace-plot_data.dat' u ($1 - 1585315068):8 w l t 'trace', 'data/who/afl-out-ASAN-wo-trace-plot_data.dat' u ($1 - 1585233041):8 w l t 'ASAN', 'data/who/afl-out-ASAN-plot_data.dat' u ($1 - 1585232663):8 w l t 'ASAN + trace', 'data/who/afl-out-wo-trace-dump-plot_data.dat' u ($1 - 1585315081):8 w l t 'normal (quick+dirty mode)', 'data/who/afl-out-trace-dump-plot_data.dat' u ($1 - 1585315079):8 w l t 'trace (quick+dirty mode)', 'data/who/afl-out-ASAN-wo-trace-dump-plot_data.dat' u ($1 - 1585233201):8 w l t 'ASAN (quick+dirty mode)', 'data/who/afl-out-ASAN-dump-plot_data.dat' u ($1 - 1585233212):8 w l t 'ASAN + trace (quick+dirty mode)'
  