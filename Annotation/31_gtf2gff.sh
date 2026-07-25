#!/bin/bash
#SBATCH --job-name=gtf2gff # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1	# Number of CPU cores per task
#SBATCH --mem=20gb            # Job memory request
#SBATCH --time=00-00:03:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta/gff3

source ~/.bashrc
micromamba activate braker3

export gtf=/path/to/polished_assembly_fasta/annotation_with_Chordata_carabs/braker/braker.gtf

gtf2gff.pl < $gtf --gff3 --out=NES782_with_Chordata_carabs_braker.gff3
