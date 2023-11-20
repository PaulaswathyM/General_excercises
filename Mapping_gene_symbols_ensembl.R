#how to map a list of ensembl transcript ids to gene symbol
#first read the file with ids into an object

Ids<- read.csv("D:/Capulus_thera/BLOG_WRITEUPS/AR_V7_correlated_ids_0_3_greater.txt")

#to map the ids we will be using biomart library. Load the library

library(biomaRt)
mart <- useMart(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")

res <- getBM(attributes = c('ensembl_transcript_id_version', 
                            'ensembl_gene_id', 
                            'external_transcript_name',
                            'external_gene_name'),
             filters = 'ensembl_transcript_id_version', 
             values = Ids,
             mart = mart)
head(res)

#now save the mapped list into a file

write.table(res, file="D:/Capulus_thera/BLOG_WRITEUPS/AR_V7_cor_ids_0_3_grtr_mapped.txt",sep = "\t", row.names = TRUE )
#if you are looking only for the unique list of gene symbols
gene_list <- unique(res$external_gene_name)
