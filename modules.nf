// Use lima to demux PacBio files.
process Demux { 
    container "quay.io/biocontainers/lima:2.4.0--h9ee0642_1"

    // Retry on fail at most three times 
    errorStrategy 'retry'
    maxRetries 2

    input:
        file CCS_BAM,
        file READS_BAM,
        file FASTA
    output: 
        file("*")

    publishDir "${params.OUTDIR}", mode: 'copy',pattern:'*.bam'

    script:
    """
    #!/bin/bash

    /usr/local/bin/lima ${CCS_BAM} ${FASTA} ${READS_BAM} --different --ccs --peek-guess --split-bam-named
    """
}