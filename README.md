## Overview

This repository contains the scripts used for genome assembly and annotation.

The workflow includes:

- Genome assembly from PacBio HiFi reads
- Assembly quality assessment
- Contamination assessment and removal
- Genome annotation

The scripts were developed and executed on an HPC environment.

## Programes

1. Genome assembly
   - HiFiAdapterFilt
   - Hifiasm

2. Assembly statistics
   - Jellyfish
   - KMC
   - GenomeScope
   - BUSCO
   - QUAST

3. Contamination control
   - BLAST
   - BlobToolKit
   - seqkit

4. Annotation
   - RepeatModeler
   - RepeatMasker
   - ProtHint
   - BRAKER

5. Supporting utilities
   - SAMtools
   - Minimap2
   - R
