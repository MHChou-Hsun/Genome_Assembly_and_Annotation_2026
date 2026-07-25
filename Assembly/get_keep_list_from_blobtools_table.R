blob <- read.delim("./filtered_with_Chordata/NES728_filtered_summary_table.tsv")
IDs <- as.data.frame(blob[,2])
write.table(IDs, file = "./filtered_with_Chordata/keep_list_with_Chordata.txt", quote = F, row.names = F, col.names = F)
