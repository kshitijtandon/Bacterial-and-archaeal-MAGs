library(ggplot2)
library(reshape2)
library(gridExtra)
library(grid)
library(cowplot)
data_compl=read.table(file.choose(),header=T,sep="\t") #completeness file/contamination file
head(data_compl)
colnames(data_compl)=c("Bins","Completeness","Coral")
p1=ggplot(data_compl, aes(x=Coral,y=Completeness,colour=Coral)) + 
  geom_boxplot()+theme_classic()+geom_jitter(size=1,alpha=0.3)+scale_color_brewer(palette = "Dark2")


data_contam=read.table(file.choose(),header=T,sep="\t") #completeness file/contamination file
head(data_contam)
colnames(data_contam)=c("Bins","Contamination","Coral")
p2=ggplot(data_contam, aes(x=Coral,y=Contamination,colour=Coral)) + 
  geom_boxplot()+theme_classic()+geom_jitter(size=1,alpha=0.3)+scale_color_brewer(palette = "Dark2")

plot_grid(p1,p2)
