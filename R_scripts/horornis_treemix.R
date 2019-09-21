# the source is the path to the plotting_funcs.R file
# the input for "plot_tree" is the path to the folder your treemix output (ALL OF IT is in)
## with the stem of the output file names (e.g. horornis for me)
# the ones for the clean data are for all #s of migration events I tried
# it tries up to that # of migration events, but if a number less than that has a higher lnL, it is prefered
source("D:/Documents/Projects/Horornis/Files/Treemix/plotting_funcs.R")
setwd("D:/Documents/Projects/Horornis/Files/Treemix")

plot_tree("horo_UG_jk1")
plot_tree("horo_UG_jk2")
plot_tree("horo_UG_jk3")
plot_tree("horo_UG_jk4")
