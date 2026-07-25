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

2. Assembly evaluation
   - Jellyfish
   - KMC
   - GenomeScope
   - BUSCO
   - QUAST
   - BlobToolKit

4. Annotation
   - RepeatModeler
   - RepeatMasker
   - ProtHint
   - BRAKER
