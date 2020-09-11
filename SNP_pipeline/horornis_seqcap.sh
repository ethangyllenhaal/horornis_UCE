#!/bin/bash
# heavily based on https://github.com/mgharvey/seqcap_pop, cite them if this inspires you
# note that this assumes a file structure including:
# "0_Z-loci", "2_reads", "3_velvet-output", "4_match", "5_mapping", "6_picard", "7_merge", "8_GATK", "9_vcf", and "analyses"
# also assumes you've run VelvetOptimiser per seqcap_pop pipeline and have clean reads
PICARD={path_to_picard}/picard/build/libs/picard.jar
export PICARD
gatk_old="{path_to_GATK}/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar"
# 1) match contigs to probes
python extract_uce_bypass_MGH.py 3_velvet-output/contigs.fa uce-5k-probes.fasta 4_match/horornis.fasta 4_match/horornis.lastz &&
# 2) blast ref against zebra finch Z chromosome
blastn -query 4_match/horornis.fasta -subject 0_Z-loci/Taeniopygia_guttata.taeGut3.2.4.dna.chromosome.Z.fa -evalue 1e-30 -outfmt 6 -out 0_Z-loci/z_loci.txt &&
# 3) trim output for python program input
sed -i 's/|.*//g' 0_Z-loci/z_loci.txt &&
# 4) remove z-linked loci
python 0_Z-loci/trim_fasta.py -i 4_match/horornis.fasta --loci 0_Z-loci/z_loci.txt -o 4_match/horornis_trimmed.fasta &&
# 5) bwa mem
sh 5_bwa.sh &&
# 6) sort and convert to bam, should probably delete SAMs at this point
sh 6_sort.sh &&
# 7) clean bams
sh 7_clean.sh &&
# 8) add read groups
sh 8_addRGs.sh &&
# 9) mark duplicates
sh 9_dedup.sh &&
# 10) merge bams
java -jar $PICARD MergeSamFiles SO=coordinate AS=true \
	I=6_picard/cettia_ruficapilla_badiceps_kunhm22504-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm22524-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm22544-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm22553-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm22563-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm24358-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm24374-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm24375-aln_dedup.bam I=6_picard/cettia_ruficapilla_badiceps_kunhm24389-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24243-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24270-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm24289-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26502-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26521-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26535-aln_dedup.bam I=6_picard/cettia_ruficapilla_castaneoptera_kunhm26539-aln_dedup.bam I=6_picard/cettia_ruficapilla_funebris_kunhm24305-aln_dedup.bam I=6_picard/cettia_ruficapilla_funebris_kunhm24325-aln_dedup.bam I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24393-aln_dedup.bam I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24399-aln_dedup.bam I=6_picard/cettia_ruficapilla_ruficapilla_kunhm24404-aln_dedup.bam I=6_picard/cettia_ruficapilla_ruficapilla_kunhm25208-aln_dedup.bam I=6_picard/cettia_ruficapilla_ruficapilla_kunhm25228-aln_dedup.bam I=6_picard/cettia_parens_amnhdot15009-aln_dedup.bam I=6_picard/cettia_parens_kunhm13537-aln_dedup.bam \
	O=7_merge/horo_merged.bam &&
# 11) index merged
samtools index 7_merge/horo_merged.bam &&
# 12) make dict
java -jar $PICARD CreateSequenceDictionary R=4_match/horo_trimmed.fasta O=4_match/horo_trimmed.dict &&
# 13) index ref
samtools faidx 4_match/horo_trimmed.fasta &&
# 14) call indels
java -jar -Xmx20g $gatk_old -T RealignerTargetCreator -R 4_match/horo_trimmed.fasta -I 7_merge/horo_merged.bam --minReadsAtLocus 7 -o 8_GATK/horo.intervals &&
# 15) realign indels
java -jar -Xmx20g $gatk_old -T IndelRealigner -R 4_match/horo_trimmed.fasta -I 7_merge/horo_merged.bam \
	-targetIntervals 8_GATK/horo.intervals -LOD 3.0 -o 8_GATK/horo_realign.bam &&
# 16) call SNPs with unified genotyper
java -jar -Xmx20g $gatk_old -T UnifiedGenotyper -R 4_match/horo_trimmed.fasta -I 8_GATK/horo_realign.bam -gt_mode DISCOVERY -o 8_GATK/horo_raw_snps.vcf -ploidy 2 -rf BadCigar -stand_call_conf 30.0 &&
# 17) annotate variants
java -jar -Xmx20g $gatk_old -T VariantAnnotator -R 4_match/horo_trimmed.fasta -I 8_GATK/horo_realign.bam \
	-G StandardAnnotation -V:variant,VCF 8_GATK/horo_raw_snps.vcf -XA SnpEff -o 8_GATK/horo_snps_annotated.vcf -rf BadCigar &&
# 18) annotate indels
java -jar -Xmx20g $gatk_old -T UnifiedGenotyper -R 4_match/horo_trimmed.fasta -I 8_GATK/horo_realign.bam \
	-gt_mode DISCOVERY -glm INDEL -o 8_GATK/horo_snps_indels.vcf -rf BadCigar &&
# 19) filter variants
java -jar -Xmx20g $gatk_old -T VariantFiltration \
	-R 4_match/horo_trimmed.fasta -V 8_GATK/horo_raw_snps.vcf \
	--mask 8_GATK/horo_snps_indels.vcf \
	--maskExtension 5 --maskName InDel --clusterWindowSize 10 \
	--filterExpression "MQ0 >= 4 && ((MQ0 / (1.0 * DP)) > 0.1)"  --filterName "BadValidation" \
	--filterExpression "QUAL < 30.0" --filterName "LowQual" \
	--filterExpression "QD < 5.0" --filterName "LowVQCBD" \
	-o 8_GATK/horo_snps_clean.vcf -rf BadCigar &&
# 20) restrict to passing snps
cat 8_GATK/horo_snps_clean.vcf | grep 'PASS\|^#' > 8_GATK/horo_snps_pass.vcf &&
# 21) read backed phasing
java -jar -Xmx20g $gatk_old -T ReadBackedPhasing -R 4_match/horo_trimmed.fasta -I 8_GATK/horo_realign.bam \
	-V 8_GATK/horo_snps_pass.vcf -L 8_GATK/horo_snps_pass.vcf -o 8_GATK/horo_snps_phased.vcf -rf BadCigar &&
# 22) make complete [these weren't used in this paper iirc]
vcftools --vcf 8_GATK/horo_snps_phased.vcf --max-missing 1.0 --out ./9_vcf/horo_snps_complete_out --min-alleles 2 --max-alleles 2 --recode &&
python remove_excessHets.py -i 9_vcf/horo_snps_complete_out.recode.vcf -o 9_vcf/horo_snps_complete_out_fix.vcf -n 0.8 &&
python random_vcf.py -i 9_vcf/horo_snps_complete_out_fix.vcf -o analyses/horo_100_rand_out.vcf &&
vcftools --vcf 8_GATK/horo_snps_phased.vcf --max-missing 1.0 --out ./9_vcf/horo_snps_complete_out_noSingle --min-alleles 2 --max-alleles 2 --maf 0.025 --recode &&
python remove_excessHets.py -i 9_vcf/horo_snps_complete_out_noSingle.recode.vcf -o 9_vcf/horo_snps_complete_out_noSingle_fix.vcf -n 0.8 &&
python random_vcf.py -i 9_vcf/horo_snps_complete_out_noSingle_fix.vcf -o analyses/horo_100_rand_out_noSingle.vcf &&
# 23) complete for ingroup only
vcftools --vcf 8_GATK/horo_snps_phased.vcf --max-missing 1.0 --out ./9_vcf/horo_snps_complete --min-alleles 2 --max-alleles 2 \
	--remove-indv cettia_parens_kunhm13537 --remove-indv cettia_parens_amnhdot15009 --recode &&
python remove_excessHets.py -i 9_vcf/horo_snps_complete.recode.vcf -o 9_vcf/horo_snps_complete_fix.vcf -n 0.8 &&
python random_vcf.py -i 9_vcf/horo_snps_complete_fix.vcf -o analyses/horo_100_rand.vcf &&
vcftools --vcf 8_GATK/horo_snps_phased.vcf --max-missing 1.0 --out ./9_vcf/horo_noSingle --min-alleles 2 --max-alleles 2 \
	--remove-indv cettia_parens_kunhm13537 --remove-indv cettia_parens_amnhdot15009 --maf 0.025 --recode &&
python remove_excessHets.py -i 9_vcf/horo_noSingle.recode.vcf -o 9_vcf/horo_noSingle_fix.vcf -n 0.8 &&
python random_vcf.py -i 9_vcf/horo_noSingle_fix.vcf -o analyses/horo_100_rand_noSingle.vcf
# 24) analyses
sh horornis_input.sh



