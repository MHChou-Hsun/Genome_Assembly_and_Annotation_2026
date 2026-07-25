#!/bin/bash
#SBATCH --job-name=gfa_to_fasta # Job name
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mc4288@nau.edu     # Where to send mail
#SBATCH --nodes=1-1                   # Run a single task
#SBATCH --ntasks-per-node=10            # Number of CPU cores per task
#SBATCH --mem=1gb            # Job memory request
#SBATCH --time=00-00:10:00              # Time limit days-hrs:min:sec
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --chdir=/scratch/mc4288/NES728_pacbio_revio_long_read/fastq_read/hifiasm_results

awk '/^S/{print ">"$2;print $3}' NES728.hifi.asm.bp.hap1.p_ctg.gfa > NES728.hifi.asm.bp.hap1.p_ctg.fasta

awk '/^S/{print ">"$2;print $3}' NES728.hifi.asm.bp.hap2.p_ctg.gfa > NES728.hifi.asm.bp.hap2.p_ctg.fasta

awk '/^S/{print ">"$2;print $3}' NES728.hifi.asm.bp.p_ctg.gfa > NES728.hifi.asm.bp.p_ctg.fasta