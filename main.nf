#!/usr/bin/env nextflow

// Using the Nextflow DSL-2 to account for the logic flow of this workflow
nextflow.preview.dsl=2

// Print help message
def helpMessage() {
    log.info"""
    Usage: 
    An example command for running the pipeline is as follows:
    nextflow run greninger-lab/covid_swift_pipeline -resume -with-docker ubuntu:18.04 --INPUT example/ --OUTDIR example/output/ --PRIMERS v2
    
    Parameters:
        --CCS_BAM       Bam usually ending in hifi_reads.bam or css.bam. [REQUIRED]
        --READS_BAM     Bam with reads in them. [REQUIRED]
        --FASTA         Barcodes fasta. [REQUIRED]
        --OUTDIR        Output directory. [REQUIRED]
        -with-docker ubuntu:18.04   [REQUIRED]
        -resume [RECOMMENDED]
        -profile        Specify which profile to run. For AWS, run with -profile cloud_big. For large memory-intensive runs on AWS, run with -profile cloud_bigger.
        
    """.stripIndent()
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
/*                                                    */
/*          SET UP CONFIGURATION VARIABLES            */
/*                                                    */
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

// Show help message
params.help = false
if (params.help){
    helpMessage()
    exit 0
}

// Initializing flags
CCS_BAM = file(params.CCS_BAM)
READS_BAM = file(params.READS_BAM)
FASTA = file(params.FASTA)

params.OUTDIR= false
// Throw error if --OUTDIR not set
if (params.OUTDIR == false) {
    println( "Must provide an output directory with --OUTDIR") 
    exit(1)
}
// Make sure OUTDIR ends with trailing slash
if (!params.OUTDIR.endsWith("/")){
   println("Make sure your output directory ends with trailing slash.")
   exit(1)
}

// Import processes 
include { Demux } from './modules.nf'

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
/*                                                    */
/*                 RUN THE WORKFLOW                   */
/*                                                    */
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

workflow {
    Demux (
        CCS_BAM,
        READS_BAM,
        FASTA
    )
}
