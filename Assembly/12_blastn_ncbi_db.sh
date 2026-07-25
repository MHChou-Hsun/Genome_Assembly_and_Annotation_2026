#!/bin/bash
#SBATCH --job-name=BLASTn # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=100gb            # Job memory request
#SBATCH --time=03-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results

module load anaconda3
module load blast/2.13.0
module load parallel/20220522

conda activate seqkit

set -euo pipefail

# ----------------------------
# Define variables
# ----------------------------
export assembly="/path/to/NES728.hifi.asm.bp.p_ctg.fasta"
export nt_DB="/path/to/core_nt_db/core_nt"
export chunk_DIR="/path/to/blast_chunks"
output_name=NES728
threads_per_BLAST=4
parallel_jobs=8
NUM_chunks=8

# ----------------------------
# Make chunk directory
# ----------------------------
mkdir -p ${chunk_DIR}

# ----------------------------
# Count contigs
# ----------------------------
NUM_contigs=$(grep -c ">" ${assembly})
echo "Total contigs: ${NUM_contigs}"

# ----------------------------
# Split assembly into balanced chunks
# ----------------------------
echo "Splitting into ${NUM_chunks} chunks..."

seqkit split2 \
    -p ${NUM_chunks} \
    ${assembly} \
    -O ${chunk_DIR}

# ----------------------------
# Run megablast
# ----------------------------
echo "Running megablast in parallel..."

parallel -j ${parallel_jobs} "
    blastn \
        -task megablast \
        -query {} \
        -db ${nt_DB} \
        -evalue 1e-25 \
        -max_target_seqs 3 \
        -num_threads ${threads_per_BLAST} \
        -out {.}.blast.out \
        -outfmt '6 qseqid staxids bitscore std'
" ::: ${chunk_DIR}/*.fasta

# ----------------------------
# Merge outputs
# ----------------------------
echo "Merging BLAST outputs..."

cat ${chunk_DIR}/*.blast.out > ${chunk_DIR}/${output_name}.megablast.outfmt6

# Clean up temp files
rm -rf ${chunk_DIR}/*.blast.out
rm -rf ${chunk_DIR}/*.fasta

echo "Megablast finished successfully."