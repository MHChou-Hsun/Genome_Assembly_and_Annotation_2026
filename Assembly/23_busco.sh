#!/bin/bash
#SBATCH --job-name=busco # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-03:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results/

module load anaconda3

conda activate BUSCO

busco -i NES728_hifi_filtered_with_Chordata.fasta \
  -l coleoptera_odb12 \
  -m genome \
  -c 16 \
  -o polished_busco_results

conda deactivate
