library(phyloseq)
library(dplyr)
library(ggplot2)
setwd("/Users/kshitij/Desktop/Melbourne work/UNIMEL_DP/Analysis/CAT_BAT_analysis/Plutea_MAGs/New_Analysis/Relative_read_coverage/Bacteria/plot_data/")
pl_tax <- read.table("Taxonomy_archaea_bacteria.txt", header = TRUE, sep = "\t",row.names=1)
head(pl_tax)
#rownames(tax)=tax[,1]
pl_tax <-  as.matrix(pl_tax)
#colnames(tax)=c("Class")
Bin_abundance_pl <- read.table("Average_coverage_archaea_bacteria.txt", header = TRUE,row.names = 1)
head(Bin_abundance_pl)
Bin_abundance_pl <- Bin_abundance_pl[,c(1:5)]
phy_pl=phyloseq(otu_table(Bin_abundance_pl,taxa_are_rows = TRUE),tax_table(pl_tax))
phy_pl
#phy <- tax_glom(phy, taxrank = "Class")
phy_pl<-transform_sample_counts(phy_pl,function(x) 100*x/sum(x))
phy.glom_pl<-tax_glom(phy_pl,taxrank = "Class")
phy_df_pl<- psmelt(phy.glom_pl)
phy_df_pl$Class<- as.character(phy_df_pl$Class) 
phy_df_pl$Class[phy_df_pl$Abundance < 1] <- "< 1% abund."
myCol_pl = c("grey90", "violet", "mediumpurple1", "slateblue1", "purple", "purple3",
          "turquoise2", "skyblue", "steelblue", "blue2", "navyblue",
          "orange", "tomato", "coral2", "palevioletred", "tan", "red2",
          "springgreen2", "yellowgreen", "palegreen4",
          "wheat2")
p=ggplot(phy_df_pl, aes(x = Sample, y = Abundance,fill=Class))+geom_bar(stat="identity",position="stack")+scale_fill_manual(values=myCol_pl)+theme(legend.position="bottom",axis.title.x=element_blank(),axis.text.x=element_text(angle=90,hjust=1),panel.grid = element_blank(), panel.background = element_blank())+guides(colour = guide_legend(ncol= 2))
p=p+coord_flip()
##################################### Isopora palifera############################################33333
setwd("/Users/kshitij/Desktop/Melbourne work/UNIMEL_DP/Analysis/CAT_BAT_analysis/Ipalifera_MAGs/Relative_read_coverage/Bacteria/Plot_input/")
tax_ip <- read.table("Taxonomy.txt", header = TRUE, sep = "\t",row.names=1)
head(tax_ip)
#rownames(tax)=tax[,1]
tax_ip <-  as.matrix(tax_ip)
#colnames(tax)=c("Class")
Bin_abundance_ip <- read.table("plot_input_average_coverage.txt", header = TRUE,row.names = 1)
head(Bin_abundance_ip)
Bin_abundance_ip <- Bin_abundance_ip[,c(1:5)]
phy_ip=phyloseq(otu_table(Bin_abundance_ip,taxa_are_rows = TRUE),tax_table(tax_ip))
phy_ip
#phy <- tax_glom(phy, taxrank = "Class")
phy_ip<-transform_sample_counts(phy_ip,function(x) 100*x/sum(x))
phy.glom_ip<-tax_glom(phy_ip,taxrank = "Class")
phy_df_ip<- psmelt(phy.glom_ip)
phy_df_ip$Class<- as.character(phy_df_ip$Class) 
phy_df_ip$Class[phy_df_ip$Abundance < 1] <- "< 1% abund."
myCol_ip = c("grey90", "violet", "mediumaquamarine", "mediumpurple1","darkolivegreen1", "navyblue",
          "tan", "red2","orangered","indianred1",
          "springgreen2",  "palegreen4")
p2=ggplot(phy_df_ip, aes(x = Sample, y = Abundance,fill=Class))+geom_bar(stat="identity",position="stack")+scale_fill_manual(values=myCol_ip)+coord_flip()+theme(legend.position="bottom",axis.title.x=element_blank(),axis.text.x=element_text(angle=90,hjust=1),panel.grid = element_blank(), panel.background = element_blank())+guides(colour = guide_legend(nrow = 3))

grid.arrange(p,p2)
