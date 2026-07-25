#!/bin/bash
#SBATCH --job-name=btk_create # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results

module load anaconda3

conda activate btk

blobtools create \
  --fasta NES728.hifi.asm.bp.p_ctg.fasta \
  --hits ./blast_chunks/NES728.megablast.outfmt6 \
  --taxid 7041 \
  --taxdump /path/to/btk_taxdump/ \
  --replace \
  NES728_Blob


# --fasta NES728.hifi.asm.bp.p_ctg.fasta: the assembly
# --hits ./blast_chunks/NES728.megablast.outfmt6: the blast output
# taxid=7041 Coleoptera
# To get btk taxdump: wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.tar.gz