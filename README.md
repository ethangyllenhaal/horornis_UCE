# horornis_UCE
Utility scripts and pipelines used for a population genetic study of Horornis ruficapilla.

The utility_scripts folder contains scripts generated for this study to do assorted small tasks. Depending on when you see this, the scripts may be out of date, see https://github.com/ethangyllenhaal/assorted_scripts for more detailed descriptions and more updated/maintained versions. These scripts include ones used for removing given loci from a fasta file, randomly selecting one SNP per locus from a fasta file, summarizing a file of fastsimcoal output parameters, and removing SNPs with an excess of heterozygotes (i.e. potential paralogs).

The R scripts folder contains .R files used to run Adegenet, sNMF, and ABBA/BABA analyses (bootstrapping scripts in one file, actually running it in another). Also, although it is very simple, the file used for visualizing treemix output is included. ABBA/BABA analysis is based on methods outlined an excellent tutorial by Simon Martin (https://github.com/simonhmartin/tutorials/tree/master/ABBA_BABA_whole_genome) with my own bootstrapping implementation.

The fastsimcoal folder contained a "clean" set of directories for how I ran the analysis and a brief description of how I went about it. It is a bit hodge-podge due to the learning process, but you'll get the idea.

The SNP_pipeline folder includes shell scripts I used to run the SNP calling pipeline based on Mike Harvey's excellent seqcap_pop (https://github.com/mgharvey/seqcap_pop) and generate input files for other analyses.
