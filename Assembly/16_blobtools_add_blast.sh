#!/bin/bash
#SBATCH --job-name=btk_add_blast # Job name
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

blobtools add \
  --hits ./blast_chunks/NES728.megablast.outfmt6 \
  --hits-cols 1=qseqid,2=staxids,3=bitscore,5=sseqid,10=qstart,11=qend,14=evalue \
  --taxrule bestsum \
  --taxdump /path/to/btk_taxdump/ \
  NES728_Blob
  
## bestsum assigns the taxon for which the sum of bitscores is greatest across all files
## bestsumorder assigns taxonomy based on the sum of bitscores for the hits to a given taxon based on the first file,
			# only using subsequent results files for contigs with no hits a previous file