#!/bin/bash
#SBATCH --job-name=prothint # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-03:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta/annotation_with_Chordata_OrthoDB12/

# cat Carabus_problematicus_protein.fa Nebria_brevicollis_protein.fa Pterostichus_madidus_protein.fa > conca_proteins.fasta

module purge
module load perl/5.36.0-nara

export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB
export PATH=$HOME/perl5/bin:$PATH
export ProtHint_DIR=/path/to/GeneMark-ETP/bin/gmes/ProtHint/bin
export PATH=$PATH:/path/to/GeneMark-ETP/bin/gmes
export rpmsk_DIR=/path/to/polished_assembly_fasta/repeatmasker_with_Chordata_results

$ProtHint_DIR/prothint.py \
    --threads 32 \
        ${rpmsk_DIR}/NES728_hifi_filtered_with_Chordata.fasta.masked.masked \
        conca_proteins.fasta
