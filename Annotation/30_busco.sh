#!/bin/bash
#SBATCH --job-name=busco # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta

module load anaconda3
conda activate BUSCO

export protein_DIR=/path/to/annotation_OrthoDB12/braker
export output_DIR=/path/to/annotation_OrthoDB12/braker/busco_results

busco -i ${protein_DIR}/braker.fasta \
  -l coleoptera_odb12 \
  -m protein \
  -c 16 \
  -o $output_DIR

conda deactivate
