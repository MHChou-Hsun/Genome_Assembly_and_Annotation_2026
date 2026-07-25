#!/bin/bash
#SBATCH --job-name=repeatmasker_2nd # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=01-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

source ~/.bashrc
micromamba activate repeatmodeler

export rmdlr_DIR=/path/to/polished_assembly_fasta/repeatmodeler_results
export rmskr_DIR=/path/to/polished_assembly_fasta/repeatmasker_results_1st

RepeatMasker \
	-lib ${rmdlr_DIR}/NES728_rmdlr_db-families.fa \
	-s \
	-parallel 10 \
	-xsmall \
	-alignments ${rmskr_DIR}/NES728_hifi_filtered_with_Chordata.fasta.masked


# -lib: specify your species-specific repeat FASTA file produced by RepeatModeler
# -s: sensitive
# -xsmall: softmasking, that is, change the repeat regions into lowercase, rather than N