library(ggplot2)
library(tidyverse)
setwd('D:/Documents/Projects/Horornis/Files/Demographics')
dataset <- read_csv('horornis_geneflow_comp.csv')
dataset$wrapComp <- str_wrap(dataset$Comparison, width=10)

# log plot
ggplot(dataset, aes(x=fct_inorder(wrapComp), y=log(Point), ymax=log(Upper), ymin=log(Lower), col=fct_inorder(Method))) +
  geom_pointrange(aes(shape=fct_inorder(Method)), position = position_dodge(1), size=1) +
  scale_shape_manual(values=c(19, 17, 0, 1, 2)) + 
  scale_color_manual(values = c("royalblue3", "royalblue1", "orange4", "orange3", "orange")) +
  xlab("") + ylab("Ln(ratio of migrants)") +
  theme_bw()
