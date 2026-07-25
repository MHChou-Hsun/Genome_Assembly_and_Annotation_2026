library(dplyr)

blob <- read.delim("./filtered_with_Chordata/NES728_filtered_summary_table.tsv")

summary_table <- blob %>%
  group_by(bestsum_phylum) %>%
  summarise(
    n_contigs = n(),
    total_length = sum(length),
    mean_cov = mean(NES728.hifi.asm.bp.p_ctg.sorted_cov),
    mean_gc = mean(gc)
  ) %>%
  arrange(desc(total_length))

write.table(summary_table, file = "./filtered_with_Chordata/NES728_filtered_summary_table.txt")