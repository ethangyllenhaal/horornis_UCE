#!/bin/bash
# finds and marks PCR duplicates
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm22504-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm22504-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm22504.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm22524-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm22524-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm22524.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm22544-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm22544-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm22544.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm22553-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm22553-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm22553.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm22563-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm22563-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm22563.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm24358-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm24358-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm24358.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm24374-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm24374-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm24374.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm24375-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm24375-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm24375.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_badiceps_kunhm24389-aln_rg.bam O=6_picard/cettia_ruficapilla_badiceps_kunhm24389-aln_dedup.bam M=6_picard/cettia_ruficapilla_badiceps_kunhm24389.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24243-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm24243-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm24243.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24270-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm24270-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm24270.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24289-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm24289-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm24289.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26502-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm26502-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm26502.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26521-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm26521-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm26521.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26535-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm26535-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm26535.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26539-aln_rg.bam O=6_picard/cettia_ruficapilla_castaneoptera_kunhm26539-aln_dedup.bam M=6_picard/cettia_ruficapilla_castaneoptera_kunhm26539.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_funebris_kunhm24305-aln_rg.bam O=6_picard/cettia_ruficapilla_funebris_kunhm24305-aln_dedup.bam M=6_picard/cettia_ruficapilla_funebris_kunhm24305.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_funebris_kunhm24325-aln_rg.bam O=6_picard/cettia_ruficapilla_funebris_kunhm24325-aln_dedup.bam M=6_picard/cettia_ruficapilla_funebris_kunhm24325.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24393-aln_rg.bam O=6_picard/cettia_ruficapilla_ruficapilla_kunhm24393-aln_dedup.bam M=6_picard/cettia_ruficapilla_ruficapilla_kunhm24393.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24399-aln_rg.bam O=6_picard/cettia_ruficapilla_ruficapilla_kunhm24399-aln_dedup.bam M=6_picard/cettia_ruficapilla_ruficapilla_kunhm24399.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24404-aln_rg.bam O=6_picard/cettia_ruficapilla_ruficapilla_kunhm24404-aln_dedup.bam M=6_picard/cettia_ruficapilla_ruficapilla_kunhm24404.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_ruficapilla_kunhm25208-aln_rg.bam O=6_picard/cettia_ruficapilla_ruficapilla_kunhm25208-aln_dedup.bam M=6_picard/cettia_ruficapilla_ruficapilla_kunhm25208.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_ruficapilla_ruficapilla_kunhm25228-aln_rg.bam O=6_picard/cettia_ruficapilla_ruficapilla_kunhm25228-aln_dedup.bam M=6_picard/cettia_ruficapilla_ruficapilla_kunhm25228.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_parens_amnhdot15009-aln_rg.bam O=6_picard/cettia_parens_amnhdot15009-aln_dedup.bam M=6_picard/cettia_parens_amnhdot15009.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false
java -jar $PICARD MarkDuplicates I=6_picard/cettia_parens_kunhm13537-aln_rg.bam O=6_picard/cettia_parens_kunhm13537-aln_dedup.bam M=6_picard/cettia_parens_kunhm13537.metrics MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 ASSUME_SORTED=true REMOVE_DUPLICATES=false

