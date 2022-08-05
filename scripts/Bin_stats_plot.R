library(ggplot2)
library(reshape2)
data=read.table(file.choose(),header=T,sep="\t")#bin_stats.txt
df=melt(data)
head(df)
colnames(df)=c("Step","Coral","Bins")
ggplot(df, aes(x=Step, y=Bins, fill=Coral)) +
  geom_bar(stat="identity", position=position_dodge(),color="black")+theme_classic()+scale_fill_brewer(palette="Greens")+geom_text(aes(label = Bins), hjust = 1,vjust=-0.6)

