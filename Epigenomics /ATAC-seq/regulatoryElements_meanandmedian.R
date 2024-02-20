
setwd("C:/Users/smanz/OneDrive/Escritorio/OMIC_DATA_ANALYSIS/EPIGENOMICS/First_part/ChipSeq/First_TASK")

sigmoid_regulatoryElements <- read.delim("sigmoid.regulatory.elements.genes.distances.tsv", sep = "\t", header = F)
stomach_regulatoryElements <- read.delim("stomach.regulatory.elements.genes.distances.tsv", sep = "\t", header = F)


colnames(sigmoid_regulatoryElements) <- c("closest gene", "start of the gene", "distance RE")
colnames(stomach_regulatoryElements) <- c("closest gene", "start of the gene", "distance RE")


mean(sigmoid_regulatoryElements$`distance RE`) # 73635.89
mean(stomach_regulatoryElements$`distance RE`) # 45227.05


median(sigmoid_regulatoryElements$`distance RE`) # 35802
median(stomach_regulatoryElements$`distance RE`) # 27735
