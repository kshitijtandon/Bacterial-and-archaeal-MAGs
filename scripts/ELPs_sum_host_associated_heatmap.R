getwd()
library(pheatmap)
library(RColorBrewer)
library(circlize)
library(ComplexHeatmap)

setwd("/Users/kshitij/Desktop/Melbourne work/UNIMEL_DP/Analysis/CAT_BAT_analysis/Plutea_MAGs/New_Analysis/Metabolism/Enrichm_metabolic_selective_modules/")
data =read.table(file.choose(),sep="\t",header=T,row.names = 1)
head(data)
col_fun=colorRamp2(c(0,10,20,30,40,50,60), c("white","#CDDC39","#9E9D24","olivedrab3","orangered3","orangered4","red"))
Heatmap(as.matrix(data[,1:4]),cluster_rows = F,cluster_columns = F,col=col_fun, row_names_gp = gpar(fontsize=8),column_names_gp = gpar(fontsize=8),column_gap = unit(4,"mm"),left_annotation = rowAnnotation(count=anno_barplot(rowSums(data[,1:4]),gp=gpar(fill="blue"))),row_labels = data[,6])
        
############## Ipalifera_ELP_plot################333     
setwd("/Users/kshitij/Desktop/Melbourne work/UNIMEL_DP/Analysis/CAT_BAT_analysis/Ipalifera_MAGs/Metabolism/ELPs")
data =read.table(file.choose(),sep="\t",header=T,row.names = 1)
head(data)
col_fun=colorRamp2(c(0,10,20,30,40,50,60), c("white","#CDDC39","#9E9D24","olivedrab3","orangered3","orangered4","red"))
Heatmap(as.matrix(data[,1:4]),cluster_rows = F,cluster_columns = F,col=col_fun, row_names_gp = gpar(fontsize=8),column_names_gp = gpar(fontsize=8),column_gap = unit(4,"mm"),left_annotation = rowAnnotation(count=anno_barplot(rowSums(data[,1:4]),gp=gpar(fill="blue"))),row_labels = data[,6])
