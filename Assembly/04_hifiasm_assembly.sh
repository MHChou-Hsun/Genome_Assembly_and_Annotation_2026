#!/bin/bash
#SBATCH --job-name=hifiasm_assembly    # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=01-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/fastq

export hifiasm=/path/to/hifiasm

mkdir -p hifiasm_results

$hifiasm -o ./hifiasm_results/NES728.hifi.asm -t 32 NES728.hifi_reads.filt.fastq.gz
