#!/bin/bash
#SBATCH --job-name=seqkit_polishing # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

module load anaconda3

conda activate seqkit

export input_assembly_DIR=/path/to/unpolish.fasta

seqkit grep -f ./filtered_no_Chordata/keep_list_no_Chordata.txt \
	${input_assembly_DIR}/NES728.hifi.asm.bp.p_ctg.fasta \
	-o NES728_hifi_filtered_no_Chordata.fasta

seqkit grep -f ./filtered_with_Chordata/keep_list_with_Chordata.txt \
	${input_assembly_DIR}/NES728.hifi.asm.bp.p_ctg.fasta \
	-o NES728_hifi_filtered_with_Chordata.fasta
