#!/bin/bash
#SBATCH --job-name=jellyfish # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/fastq

source ~/.bashrc
micromamba activate jellyfish

# Step 1: Count k-mers (canonical)
jellyfish count -C -m 21 -s 10G -t 5 <(zcat NES728.hifi_reads.filt.fastq.gz) -o NES728.hifi_reads.jf

# Step 2: Generate histogram
jellyfish histo -t 5 NES728.hifi_reads.jf > NES728.hifi_reads.histo

micromamba deactivate