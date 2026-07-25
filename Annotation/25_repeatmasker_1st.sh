#!/bin/bash
#SBATCH --job-name=repeatmasker_1st # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=01-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

source ~/.bashrc
micromamba activate repeatmodeler

mkdir -p repeatmasker_results_1st

RepeatMasker \
	-species metazoa \
	-s \
	-parallel 32 \
	-xsmall \
	-alignments \
	-dir ./repeatmasker_results_1st \
	NES728_hifi_filtered_with_Chordata.fasta

# -s: sensitive
# -parallel 10: number of threads
# -xsmall: softmasking, that is, change the repeat regions into lowercase, rather than N
