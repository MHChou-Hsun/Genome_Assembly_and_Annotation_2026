#!/bin/bash
#SBATCH --job-name=interproscan # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1	# Number of CPU cores per task
#SBATCH --mem=10gb            # Job memory request
#SBATCH --time=00-01:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/InterProScan_v5.59/

source ~/.bashrc
micromamba activate interproscan

cd ./interproscan-5.59-91.0

python3 setup.py -f interproscan.properties

./interproscan.sh -i test_all_appl.fasta -f tsv -dp
./interproscan.sh -i test_all_appl.fasta -f tsv

# Replace lsf with slurm
# Replace bsub with sbatch
# Replace -q QUEUE_NAME with -p core
# Replace -M 8192 with --mem=8G or --mem=16G