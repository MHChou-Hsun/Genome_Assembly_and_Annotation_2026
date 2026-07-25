#!/bin/bash
#SBATCH --job-name=repeatmodeler # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=200gb            # Job memory request
#SBATCH --time=03-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

source ~/.bashrc
micromamba activate repeatmodeler

export ninja_DIR=/path/to/NINJA-0.95-cluster_only/NINJA

BuildDatabase \
	-name NES728_rmdlr_db NES728_hifi_filtered_with_Chordata.fasta

RepeatModeler \
	-database NES728_rmdlr_db \
	-threads 32 \
	-LTRStruct \
	-ninja_dir ${ninja_DIR}

# -LTRStruct: runs the LTR structural discovery pipeline for discovering LTR retrotransposons

#=============
# Get NINJA
#=============
# wget https://github.com/TravisWheelerLab/NINJA/archive/refs/tags/0.98-cluster_only.tar.gz
# tar -zxvf 0.98-cluster_only.tar.gz
# cd NINJA-0.98-cluster_only/NINJA/
# make # Create the ‘‘Ninja’’ executable file
# pwd