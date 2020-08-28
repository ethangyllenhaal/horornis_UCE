# horornis_UCE
Utility scripts and pipelines used for a population genetic study of Horornis ruficapilla.

The utility_scripts folder contains scripts generated for this study to do assorted small tasks. Depending on when you see this, the scripts may be out of date, see https://github.com/ethangyllenhaal/assorted_scripts for more detailed descriptions and more updated/maintained versions. These scripts include ones used for removing given loci from a fasta file, randomly selecting one SNP per locus from a vcf file, summarizing a file of fastsimcoal output parameters, and removing SNPs with an excess of heterozygotes (i.e. potential paralogs).

The R scripts folder contains .R files used to run Adegenet and sNMF analyses. It also includes the file used for visualizing the gene flow ratio outputs.

The fastsimcoal folder contained a "clean" set of directories for how I ran the analysis and a brief description of how I went about it. It is a bit hodge-podge due to the learning process, but you'll get the idea.

The SNP_pipeline folder includes shell scripts I used to run the SNP calling pipeline based on Mike Harvey's excellent seqcap_pop (https://github.com/mgharvey/seqcap_pop) and generate input files for other analyses.
