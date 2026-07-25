#!/bin/bash
#SBATCH --job-name=interproscan # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=02-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

source ~/.bashrc
micromamba activate interproscan

export interproscan_DIR=/path/to/InterProScan_v5.59/interproscan-5.59-91.0
export protein_DIR=/path/to/annotation_OrthoDB12/braker
export output_DIR=/path/to/annotation_OrthoDB12/braker/interproscan_results

mkdir -p $output_DIR

${interproscan_DIR}/interproscan.sh \
		-mode cluster \
		-clusterrunid orthodb12_interpro \
		-i ${protein_DIR}/braker.fasta \
		-f tsv \
		-b ${output_DIR} \
		-cpu 16

# Open braker.fasta and remove "*", and then store to braker.fasta