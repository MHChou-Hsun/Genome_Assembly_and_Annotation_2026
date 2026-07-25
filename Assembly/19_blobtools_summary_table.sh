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
#SBATCH --chdir=/path/to/hifiasm_results

module load anaconda3
module load R/4.5.1

conda activate btk

#==================# 
# Before polishing
#==================# 

blobtools filter \
	--table ./NES728_Blob/NES728_summary_table.tsv \
	NES728_Blob

R CMD BATCH --no-save write_blobtools_summary_table.R
