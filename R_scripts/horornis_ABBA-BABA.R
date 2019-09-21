# set working directory
setwd('D:/Documents/Projects/Horornis/Files/ABBA_BABA')
# used for getting block indices, jacknife.R is from https://github.com/simonhmartin/genomics_general
source('D:/Analysis/genomics_general/jackknife.R')
source("D:/Documents/Projects/Horornis/Horornis/Files/ABBA_BABA/bootstrap_ABBA-BABA.R")
freq_table = read.table("horo_redo.tsv.gz", header=T, as.is=T)

par(mfrow=c(2,2), mar = c(4, 2, 2, 1), oma = c(0, 0, 2, 0))
D_fcb <- calc_D_stat(freq_table,"funebris","castaneoptera","badiceps", 100)
F_fcb <- calc_f_hom(freq_table,"funebris","castaneoptera","badiceps", 100)
D_rbc <- calc_D_stat(freq_table, "ruficapilla","badiceps","castaneoptera", 100)
F_rbc <- calc_f_hom(freq_table, "ruficapilla","badiceps","castaneoptera", 100)
