#!/bin/bash
#SBATCH --job-name=mapping_sorting # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=your@email     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32	# Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-03:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/path/to/hifiasm_results

source ~/.bashrc
micromamba activate minimap2

module load samtools/1.15.1

minimap2 \
	-t 32 -ax map-hifi \
	NES728.hifi.asm.bp.p_ctg.fasta \
	../../NES728.hifi_reads.filt.fastq.gz \
	--secondary=no \
| samtools sort -@ 8 -o NES728.hifi.asm.bp.p_ctg.sorted.bam
