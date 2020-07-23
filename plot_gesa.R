library(ggplot2)


##### --- KEGG
#file <-read.csv("../KEGG.csv")

file <- read.csv("C://Users/18271/Desktop/fj/kegg_pathway_gsea.csv")

pdf("KEGG.pdf",width=11,height=8)
richfactor <- as.numeric(file[,4])
plot_two <- ggplot(data=file, aes( y = file[,2],x = richfactor)) +
  geom_point(aes(colour=file[,5],size=file[,3]), alpha=1) +
  labs(title = "Pathway Enrichment ",x="RichFactor",y="Pathway",size="Gene_number",colour="pValue")+
  scale_y_discrete(limits=rev(file[,2]))+
  theme(axis.text.y = element_text(face="bold", color="grey60", size=11))
print(plot_two)
dev.off()

##### --- GO 
file <-read.csv("../GO-MF.csv")


pdf("GO-MF.pdf",width=11,height=8)
richfactor <- as.numeric(file[,4])
plot_two <- ggplot(data=file, aes( x = file[,2],y = richfactor)) +
  geom_bar(stat = 'identity', aes(fill = file$PValue)) +
  labs(title = "GO-MF Enrichment for AT",y="RichFactor",x="Term",fill="pValue")+
  scale_x_discrete(limits=rev(file[,2]))+
  theme(axis.text.y = element_text(face="bold", color="grey60", size=11)) +
  coord_flip()
print(plot_two)
dev.off()
