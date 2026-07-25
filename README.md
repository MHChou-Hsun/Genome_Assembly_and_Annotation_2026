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
   - purge_haplotigs

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

4. Gene annotation
   - RepeatModeler
   - RepeatMasker
   - ProtHint
   - BRAKER3

5. Supporting utilities
   - SAMtools
   - Minimap2
   - R

## References
   - Kim, J., & Kim, C. (2022). A beginner’s guide to assembling a draft genome and analyzing structural variants with long-read sequencing technologies. STAR Protocols, 3(3). https://doi.org/10.1016/j.xpro.2022.101506
   - Singh, R. P., Weng, Y. M., Sondhi, Y., Plotkin, D., Frandsen, P. B., & Kawahara, A. Y. (2024). Genome assembly of a nocturnal butterfly (Macrosoma leucophasiata) reveals convergent adaptation of visual genes. Communications Biology, 7(1), 1664. https://doi.org/10.1038/s42003-024-07124-2
