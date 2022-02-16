# demux
Short pipeline for demuxing PacBio files

## Installation

1. Install [nextflow](https://www.nextflow.io/docs/latest/getstarted.html#installation).
   - Make sure you move nextflow to a directory in your PATH variable.
2. Install [docker](https://docs.docker.com/get-docker/).

## Usage
Example command: ```nextflow run greninger-lab/demux -latest --CCS_BAM s3://greninger-lab-archive/Nicole/tprk/20201102_TprK.NL/CCS_8340/m54329U_220201_063918.hifi_reads.bam --READS_BAM s3://greninger-lab-archive/Nicole/tprk/20201102_TprK.NL/CCS_8340/reads.bam --FASTA s3://greninger-lab-archive/Nicole/tprk/20201102_TprK.NL/CCS_8340/pacbio_barcodes.fasta --OUTDIR s3://greninger-lab-archive/Nicole/tprk/20201102_TprK.NL/CCS_8340/output/ -resume -with-report with-docker ubuntu:18.04 -c ~/nextflow.speedy.config```
