#!/bin/bash
#SBATCH --job-name=quast # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

module load anaconda3

export output_DIR=quast_with_Chordata_results

mkdir -p $output_DIR

python3 /path/to/quast.py NES728_hifi_filtered_with_Chordata.fasta \
  -o $output_DIR \
  -t 12 \
  -e

# QUAST can be conducted after assembly too.