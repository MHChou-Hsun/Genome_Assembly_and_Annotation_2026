#!/bin/bash
#SBATCH --job-name=generate_histogram # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/scratch/mc4288/NES728_pacbio_revio_long_read/fastq_read/hifiasm_results/fasta

module load anaconda3

conda activate purge_haplotigs

purge_haplotigs hist \
  -b NES728.hifi.asm.bp.p_ctg.sorted.bam \
  -g NES728.hifi.asm.bp.p_ctg.fasta

conda deactivate

# Optional; it's required only if haplotigs are present