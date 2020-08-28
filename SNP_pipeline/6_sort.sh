#!/bin/bash
# sorts SAM and converts to BAM
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm22504-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm22504-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm22524-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm22524-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm22544-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm22544-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm22553-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm22553-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm22563-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm22563-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm24358-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm24358-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm24374-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm24374-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm24375-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm24375-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_badiceps_kunhm24389-aln.sam O=5_mapping/cettia_ruficapilla_badiceps_kunhm24389-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24243-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24243-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24270-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24270-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24289-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm24289-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26502-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26502-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26521-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26521-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26535-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26535-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26539-aln.sam O=5_mapping/cettia_ruficapilla_castaneoptera_kunhm26539-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_funebris_kunhm24305-aln.sam O=5_mapping/cettia_ruficapilla_funebris_kunhm24305-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_funebris_kunhm24325-aln.sam O=5_mapping/cettia_ruficapilla_funebris_kunhm24325-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24393-aln.sam O=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24393-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24399-aln.sam O=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24399-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24404-aln.sam O=5_mapping/cettia_ruficapilla_ruficapilla_kunhm24404-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_ruficapilla_kunhm25208-aln.sam O=5_mapping/cettia_ruficapilla_ruficapilla_kunhm25208-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_ruficapilla_ruficapilla_kunhm25228-aln.sam O=5_mapping/cettia_ruficapilla_ruficapilla_kunhm25228-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_parens_amnhdot15009-aln.sam O=5_mapping/cettia_parens_amnhdot15009-aln.bam SORT_ORDER=coordinate
java -Xmx20g -jar $PICARD SortSam I=5_mapping/cettia_parens_kunhm13537-aln.sam O=5_mapping/cettia_parens_kunhm13537-aln.bam SORT_ORDER=coordinate

