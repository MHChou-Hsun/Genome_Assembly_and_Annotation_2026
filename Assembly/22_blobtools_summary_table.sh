#!/bin/bash
#SBATCH --job-name=btk_summary_table # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

#==================# 
# After polishing
#==================# 

blobtools filter \
	--table ./filtered_with_Chordata/NES728_filtered_summary_table.tsv \
	filtered_with_Chordata

R CMD BATCH --no-save get_keep_list_from_blobtools_table.R
