#!/bin/bash
#SBATCH --job-name=genomescope # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/fastq

module load R/4.5.1

export genomescope=/path/to/genomescope

mkdir -p genomescope_results

Rscript $genomescope/genomescope.R \
	-p 2 \
	-i 21mer.histo \
	-o ./genomescope_results \
	-k 21
