#!/bin/bash
# note that seqcap scripts use --all because we restricted to random earlier

# input for adegenet
python adegenet_from_vcf.py analyses/horo_100_rand.vcf ./analyses/ horornis --all &&
mv analyses/horornis_adegenet_all.stru analyses/horo_complete_adegenet_UG.stru &&
# input for sNMF
python faststructure_from_vcf.py analyses/horo_100_rand_noSingle.vcf ./analyses/ horornis --all &&
mv analyses/horornis_STRUCTURE_all.str analyses/horo_complete_UG_noSingle.str &&

# input for fastsimcoal2
python genomics_general/VCF_processing/parseVCF.py -i 9_vcf/horo_snps_complete_out.recode.vcf | gzip > analyses/horo_redo.geno.gz &&
python genomics_general/freq.py -g analyses/horo_redo.geno.gz -p badiceps -p castaneoptera -p funebris -p ruficapilla -p parens --popsFile pop_map.tsv --target derived -o analyses/horo_redo.tsv.gz &&
~/dadi/easySFS/easySFS.py -i 9_vcf/horo_complete.vcf -p pop_map_in.tsv --preview &&
~/dadi/easySFS/easySFS.py -i 9_vcf/horo_snps_complete_out.recode.vcf -p pop_map_in.tsv --proj 18,14,4,10 -o ./easySFS/ -f
# with putative admixed indiv removed
~/dadi/easySFS/easySFS.py -i 9_vcf/horo_snps_complete_out.recode.vcf -p pop_map_noadmix.tsv --proj 18,14,4,8 -o ./easySFS/noadmix -f
echo "done"
