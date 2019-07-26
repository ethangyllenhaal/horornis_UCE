# horornis_UCE
Utility scripts and pipelines used for a population genetic study of Horornis ruficapilla.

The R scripts folder contains .R files used to run Adegenet, sNMF, and ABBA/BABA analyses. Also, although it is very simple, the file used for visualizing treemix output is included. ABBA/BABA analysis is based on methods outlined an excellent tutorial by Simon Martin (https://github.com/simonhmartin/tutorials/tree/master/ABBA_BABA_whole_genome) with my own bootstrapping implementation.

The fastsimcoal folder contained a "clean" set of directories for how I ran the analysis and a brief description of how I went about it. It is a bit hodge-podge due to the learning process, but you'll get the idea.

The SNP_pipeline folder includes shell scripts I used to run the SNP calling pipeline based on Mike Harvey's excellent seqcap_pop (https://github.com/mgharvey/seqcap_pop) and generate input files for other analyses.

Also see https://github.com/ethangyllenhaal/assorted_scripts for more detailed descriptions and documentation of utility scripts included here. Those scripts will only be updated/maintained in that repository.
