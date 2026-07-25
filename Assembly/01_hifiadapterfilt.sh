#!/bin/bash
#SBATCH --job-name=hifiadapterfilt # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/raw_bam

module load blast/2.13.0
module load bamtools/2.5.2

HiFi_DIR="/path/to/HiFiAdapterFilt"
export PATH=$PATH:$HiFi_DIR
export PATH=$PATH:$HiFi_DIR/DB

mkdir -p ../fastq_read

bash $HiFi_DIR/hifiadapterfilt.sh \
  -p NES728.hifi \
  -t 10 \
  -o ../fastq_read NES728.hifi

# HiFiAdapterFilt removes adapters and converts BAM to FastQ
# Installation:
# cd path/to/where/you/want
# git clone https://github.com/sheinasim-USDA/HiFiAdapterFilt