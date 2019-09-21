setwd('D:/Documents/Projects/Horornis/Files/Adegenet')

library("adegenet")
library("ade4")
library("vcfR")
library("scales")

# set colors
tav = rgb(200, 0, 0, 255, maxColorValue = 255)
van = rgb(255, 200, 0, 255, maxColorValue = 255)
vit = rgb(0, 200, 255, 255, maxColorValue = 255)
kad = rgb(0, 0, 200, 255, maxColorValue = 255)

horo_ug<-read.structure("horo_complete_adegenet_UG.stru",n.ind=23,n.loc=4191,col.lab=1,col.pop=2)
#_, 0, n
ug_cluster <- find.clusters(horo_ug, max.n.clust = 4)
# 23, 4
dapc_ug <- dapc(horo_ug,ug_cluster$horo_ug)
# 3, 2
#compoplot(dapc_ug,col=c("#dfc27d","#80cdc1","#018571","#f5f5f5"),cex.names=0.5,legend=FALSE)
# plots with 99% Confidence ellipse
scatter(dapc_ug, cell = 3, col=c(vit, van, tav, kad, "black"), cex=2.5, pch=20, cstar = 0, lwd = 2, lty = 2, solid=0.5, scree.da = FALSE, clab=1)


###### NOT USED IN PAPER #######

# a PCA of the same data, with plotting of PCs 1v2 and 2v3
horo_vcf <- read.vcfR("horo_100_rand.vcf")
horo_gl <- vcfR2genlight(horo_vcf)
pop(horo_gl) <- c("bad", "bad", "bad", "bad", "bad", "bad", "bad", "bad", "bad", "cas", "cas", "cas", "cas", "cas", "cas", "cas", "fun", "fun", "ruf", "ruf", "ruf", "ruf", "ruf")
pca <- glPca(horo_gl, nf=20)
scatter(pca)
# barplot: PCs 1-3 all relevant, others not so much
barplot(pca$eig/sum(pca$eig), main="eigenvalues", col=heat.colors(length(pca$eig)))
# PCs 1 and 2 don't separate funebris and castaneopterus, 95% cellipses
s.class(pca$scores[,1:2], pop(horo_gl), col=c("blue","green","yellow","orange","red","purple", "black"), clab=1, cell=2.5)
s.class(pca$scores[,2:3], pop(horo_gl), col=c("blue","green","yellow","orange","red","purple", "black"), clab=1, cell=2.5)
