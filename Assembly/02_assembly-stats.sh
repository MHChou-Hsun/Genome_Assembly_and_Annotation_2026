#!/bin/bash
#SBATCH --job-name=assembly_statistics # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/fastq

source ~/.bashrc
micromamba activate assembly-stats

gzip -d NES728.hifi_reads.filt.fastq.gz

assembly-stats NES728.hifi_reads.filt.fastq >> NES728_50N_stats.txt
