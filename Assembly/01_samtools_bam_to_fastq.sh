#!/bin/bash
#SBATCH --job-name=bam_to_fastq # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mc4288@nau.edu     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/scratch/mc4288/NES728_pacbio_revio_long_read/raw_bam

module load samtools/1.15.1

samtools fastq -@ 8 NES728.hifi_reads.bam | gzip > ../raw_reads/NES728.hifi_reads.fastq.gz \