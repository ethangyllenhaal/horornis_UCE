#!/usr/bin/env python

'''
Made by Ethan Gyllenhaal (egyllenhaal@unm.edu)
Last updated 6 March 2019

Script for trimming a vcf file to only include one random SNP per locus, which is needed for many pop gen analyses.
Code partly inspired by scripts in the seqcap_pop pipeline (https://github.com/mgharvey/seqcap_pop).
Ethan wrote this while procrastinating and didn't include a first-snp-only function, but could if you bugged him.
Assumes the input has a format of '[locus]_ID|<rest of line>' per sqecap_pop UCE SNPs in order to exclude UCE loci with multiple probes.
If your format is only '[locus]|<rest of line>' comment lines with locus_list and remove from conditionals.
If your format has a different locus name delimiter (e.g. '[locus]-'), change split char in assignment of locus variable.

Usage is:
random_vcf.py -i /path/to/input.vcf -o /path/to/output.vcf
'''

import sys, getopt, random

def main(argv):
    # initializing variables
    in_path = ''
    out_path = ''
    # read command line input
    # -h or --help for basic usage info
    # -i or --input for input fasta
    # -o or --output for output location for trimmed fasta
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["input=","output="])
    except:
        print 'random_vcf.py -i [input] -o [output]'
        print 'Input is a vcf file with rows in order per locus with name starting with "[locus name]|".'
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-help", "-h"):
            print 'random_vcf.py -i [input]  -o [output]'
            print 'Input is a vcf file with rows in order per locus with name starting with "[locus name]|".'
        elif opt in ("-i", "--input"):
            in_path = arg
        elif opt in ("-o", "--output"):
            out_path = arg
    
    # sets up input and output files
  	in_vcf = open("{0}".format(in_path), 'r')
    vcf_lines = in_vcf.readlines()
    vcf_out = open("{0}".format(out_path), 'wg')
    snp_count = 0
    # variable declarations
    temp_loc = None
    temp_lines = []
    # can remove if only one locus per locus name
    locus_list = []
    # works through input lines
    for line in vcf_lines:
        # outputs non-locus lines
        if line.startswith("#"):
            vcf_out.write(line)
        else:
            # find locus name, change split charcter if it isn't '|' for your data
            locus = line.split('|')[0]
            locus_list.append(locus.split('_')[0])
            # appends locus name to list if there are multiple of this locus in your dataset (e.g. UCE probes)
            # remove if only one locus per locus name
            # remove "locus not in locus_list" if you don't have sub IDs for different loci
            # temp_lines is a boolean to check if temp_lines is empty, isn't python great?
            if locus != temp_loc and temp_lines and locus not in locus_list: 
                rand_int = random.randint(0,len(temp_lines)-1) # chooses random locus
                vcf_out.write(temp_lines[rand_int])
                temp_lines = [line]
                temp_loc = locus
                snp_count += 1
            # appends line to list if it is from the same locus
            elif locus == temp_loc or not temp_lines:
                temp_lines.append(line)
    # lines to catch last locus!
    if locus not in locus_list:
        rand_int = random.randint(0,len(temp_lines)-1)
        vcf_out.write(temp_lines[rand_int])
        snp_count += 1
    print("Kept {0} SNPs.".format(snp_count))
        

if __name__ == '__main__':
    main(sys.argv[1:])