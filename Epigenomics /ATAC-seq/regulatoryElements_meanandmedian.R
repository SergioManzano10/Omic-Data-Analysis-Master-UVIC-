
setwd("C:/Users/smanz/OneDrive/Escritorio/OMIC_DATA_ANALYSIS/EPIGENOMICS/ChipSeq/First_TASK")

regulatoryElements <- read.delim("regulatoryElements.genes.distances.tsv", sep = "\t", header = F)


colnames(regulatoryElements) <- c("closest gene", "start of the gene", "distance RE")

View(regulatoryElements)

mean(regulatoryElements$`distance RE`) # 63393.14
median(regulatoryElements$`distance RE`) # 31162
