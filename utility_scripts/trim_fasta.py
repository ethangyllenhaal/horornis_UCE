#!/usr/bin/env python

'''
Made by Ethan Gyllenhaal (egyllenhaal@unm.edu)
Last updated 27 August 2020

Script for removing contigs from an input fasta file by name (obtained from a blast search in our case).
Assumes the fasta has contigs starting with > and contain letters only in the ref (can be changed in the removal for loop)

Usage is:
trim_fasta.py -i /path/to/input.fasta -l /path/to/loci.txt -o /path/to/output.fasta
'''

import re, sys, getopt

def main(argv):
    # gets inputs
    in_path = ''
    out_path = ''
    loci_path = ''
    try:
        opts, args = getopt.getopt(argv,"hi:l:o:",["input=","loci=","output="])
    except:
        print 'trim_fasta.py -i [input] -loci [loci] -o [output]'
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-help", "-h"):
            print 'trim_fasta.py -i [input] -loci [loci] -o [output]'
            sys.exit()
        elif opt in ("-i", "--input"):
            in_path = arg
        elif opt in ("-l", "--loci"):
            loci_path = arg
        elif opt in ("-o", "--output"):
            out_path = arg
            
    # opens input fasta
    with open(in_path, 'r') as inFile:
        input = inFile.read()
    # initializes array for the loci
    loci=[]
    # reads in loci not to include, from BLAST
    with open(loci_path) as text:
        loci = text.readlines()
    # succinct, but replaces any locus name found in locus input file
    # not very memory efficient, for larger files loop through each contig in fasta and see if name matches anything in loci to remove then write directly to output
    for i in loci:
        replace = '>' + i.rstrip() + '(.*)\\n([A-Z]|[a-z]|\\n)*'
        input = re.sub(replace, '', input)
    # writes
    with open(out_path, 'w') as outFile:
        outFile.write(input)
if __name__ == '__main__':
    main(sys.argv[1:])
