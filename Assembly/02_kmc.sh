#!/bin/bash
#SBATCH --job-name=kmc # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/fastq

export kmc=/path/to/kmc

mkdir -p kmc_tmp

$kmc/bin/kmc -k21 -ci1 -cs10000 NES728.hifi_reads.filt.fastq.gz 21mers kmc_tmp

$kmc/bin/kmc_tools transform 21mers histogram 21mer.histo -cx10000 dump 21mers.txt


#The lower (-ci) and upper (-cs) bounds exclude k-mers with counts outside these boundaries.