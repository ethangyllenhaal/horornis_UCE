source("http://membres-timc.imag.fr/Olivier.Francois/Conversion.R")
source("http://membres-timc.imag.fr/Olivier.Francois/POPSutilities.R")
library(LEA)
setwd('D:/Documents/Projects/Horornis/Files/Structure')
# convert .str file to a .geno file, with first column being sample name and second being population #
struct2geno(file = "horo_complete_UG_noSingle.str", 
            TESS = FALSE, diploid = TRUE, FORMAT = 2,
            extra.row = 0, extra.col = 1, output = "D:/Documents/Projects/Horornis/Files/Structure/sNMF_redo.geno")

# my homemade sNMF plotting function
plot_sNMF <- function(input, k_val, colors){
  # picks best run best on cross entropy
  best_run <- which.min(cross.entropy(input, K = k_val))
  best_run
  # makes q matrix of ancestry coeffs
  q_matrix <- Q(input, K = k_val, run = best_run)
  # plots it, goes to 10 colors so you can play around, space makes blank between indivs
  barplot(t(q_matrix), col = colors, 
          border = NA, space = 0.25, xlab = "Individuals", ylab = "Admixture coefficients", horiz=FALSE)
}

# runs sNMF for all values of K (K=1:4 in my case) and 10 repetitions. The entropy = T is how you estimate best K
# note that alpha is the "cost" of introducing admixture, and higher values = less admixture
horo = snmf("D:/Documents/Projects/Horornis/Files/Structure/sNMF_redo.geno", ploidy=2, 
            K = 1:4, alpha = 10, project = "new", entropy = T, repetitions = 1000)

# plots values of K, choose K as per structure 
plot(horo, col = "blue", pch = 1, type = "o")

# assign colors for plotting
tav = rgb(200, 0, 0, 255, maxColorValue = 255)
van = rgb(255, 200, 0, 255, maxColorValue = 255)
vit = rgb(0, 200, 255, 255, maxColorValue = 255)
kad = rgb(0, 0, 200, 255, maxColorValue = 255)

# plot sNMF
# NOTE: need to play with color order to get it right
plot_sNMF(horo, 2, c(tav, van, vit, kad))
plot_sNMF(horo, 3, c(kad, van, vit, kad))
plot_sNMF(horo, 4, c(kad, tav, vit, van))


