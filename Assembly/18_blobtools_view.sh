#!/bin/bash
#SBATCH --job-name=btk_view # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results

module load anaconda3

conda activate btk

export PATH=/path/to/BlobToolKit:$PATH

blobtools view \
    --out ./NES728_Blob \
    --format svg \
    --format png \
    --view blob \
    --view snail \
    --plot \
    NES728_Blob


## Before getting images of the filtered assembly, run BUSCO and add BUSCO to Blob directory first ##

#================================================
# Install blobtoolkit-api and blobtoolkit-viewer
#================================================
# cd /path/to/BlobToolKit 
# RELEASE=4.1.5
# PLATFORM=linux # or macos
# curl -L https://github.com/blobtoolkit/blobtoolkit/releases/download/${RELEASE}/blobtoolkit-api-${PLATFORM} > blobtoolkit-api
# curl -L https://github.com/blobtoolkit/blobtoolkit/releases/download/${RELEASE}/blobtoolkit-viewer-${PLATFORM} > blobtoolkit-viewer
# chmod 755 blobtoolkit-*