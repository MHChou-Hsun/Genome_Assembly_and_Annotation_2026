#!/bin/bash
#SBATCH --job-name=btk_polishing # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:05:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results

module load anaconda3

conda activate btk

mkdir -p polished_assembly_fasta

export input_assembly_DIR=/path/to/hifiasm_results
export polished_assembly_DIR=/path/to/polished_assembly_fasta
export who_to_remove=Ascomycota,Pseudomonadota,Bacillota,Actinomycetota,Mycoplasmatota,Cnidaria,Streptophyta

blobtools filter \
     --param length--Min=1000 \
     --param NES728.hifi.asm.bp.p_ctg.sorted_cov--Min=0.1 \
     --param bestsum_phylum--Keys=${who_to_remove} \
     --fasta ${input_assembly_DIR}/NES728.hifi.asm.bp.p_ctg.fasta \
     --output ${polished_assembly_DIR}/polished_with_Chordata \
     NES728_Blob
