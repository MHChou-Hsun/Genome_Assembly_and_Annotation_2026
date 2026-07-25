#!/bin/bash
#SBATCH --job-name=braker3 # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=05-00:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/polished_assembly_fasta/annotation_no_Chordata_OrthoDB12/

source ~/.bashrc
micromamba activate braker3

export gmes_petap_DIR=/path/to/GeneMark-ETP/bin/gmes
export rpmsk_DIR=/path/to/polished_assembly_fasta/repeatmasker_with_Chordata_results

braker.pl \
	--genome=${rpmsk_DIR}/NES728_hifi_filtered_with_Chordata.fasta.masked.masked \
	--hints=prothint_augustus.gff \
	--species=Omus_audouini \
	--softmasking \
	--GENEMARK_PATH=$gmes_petap_DIR


# --hints: output of ProtHint
# --softmasking: repetitive sequences of the input genome is soft-masked; that is, repeat regions are lower case letters
# --GENEMARK_PATH: path to gmes_petap.pl

#=====================
# Install GeneMark-ETP
#=====================

# cd /to/your/desired/directory

# git clone https://github.com/gatech-genemark/GeneMark-ETP

### Go to https://genemark.bme.gatech.edu/license_download.cgi and get the license gm_key ###
# wget http://genemark.bme.gatech.edu/tmp/GMtool_L3QCU/gm_key.gz
# gunzip gm_key.gz
# cd ~/
# mkdir .gm_key
# cd /scratch/mc4288/Analytical_programs
# mv gm_key ~/.gm_key

### Install required Perl libraries (submitting a slurm job is recommended; see cpanm_install.sh) ###

## Test installation ##
#module purge
#module load perl/5.36.0-nara
#export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB
#export PATH=$HOME/perl5/bin:$PATH
#export ProtHint_DIR=/scratch/mc4288/Analytical_programs/GeneMark-ETP/bin/gmes/ProtHint/bin
#export PATH=$PATH:/scratch/mc4288/Analytical_programs/GeneMark-ETP/bin/gmes
# /path/to/GeneMark-ETP/check_install.pl


#==================
# Install AUGUSTUS
#==================

# Strongly recommend installing AUGUSTUS via conda (I'm using micromamba)
# Do not install from GitHub, where there are too many bugs that need to be fixed

# source ~/.bashrc
# micromamba install augustus

#==================
# Install BRAKER3
#==================

# source ~/.bashrc
# micromamba install braker3
# micromamba create -n braker3 braker3