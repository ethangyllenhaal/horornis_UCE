#!/usr/bin/env python

'''
Made by Ethan Gyllenhaal (egyllenhaal@unm.edu)
Last updated: 27 August 2020

NOTE: Don't judge me, this was a rushed little script so I followed like zero good practices.
Only really useable in tandem with way I ran fastsimcoal.
I am well aware there are better ways to do it.

Primitive script for processing fastsimcoal output. Assumes only text files are output form the way I did it in Horornis paper.
For a given file, prints a header and the best fit data.
Also prints mean and stDev of runs, but that doesn't really mean much for analysis. Figured I'd leave it in there.

No arguments, assumes directory structure is how I set it up @_@.
'''

def main():
    # gets parameters and sets up file
    import csv
    head = getHeader()
    data = getData()
    flip = getFlip(data)
    sterr = getSE(flip)
    mean = getMean(flip)
    reps = len(data)
    maxL = len(data[0])-2
    best = 0
    # loops through until best run is found
    for i in range(0,reps):
        if float(data[i][maxL]) > float(data[best][maxL]):
            best = i
    print('\t'.join([str(x) for x in head]))
    print('\t'.join([str(x) for x in data[best]]))
    print('\t'.join([str(x) for x in mean]))
    print('\t'.join([str(x) for x in sterr]))

# gets input from csv
def getData():
    import csv
    import fnmatch
    import os
    for file in os.listdir('.'):
        if fnmatch.fnmatch(file, '*.txt'):
            name = file
    data=[]
    with open(name) as text:
        database = csv.reader(text, delimiter='\t')
        next(database, None)
        for line in database:    
            data.append(line)
    return data

# gets header row from input
def getHeader():
    import csv
    import fnmatch
    import os
    for file in os.listdir('.'):
        if fnmatch.fnmatch(file, '*.txt'):
            name = file
    data=[]
    with open(name) as text:
        database = csv.reader(text, delimiter='\t')
        header=next(database)
    return header

# rearranges in an inefficient way
def getFlip(d):
    from scipy.stats import sem
    out = []
    for i in range (0, len(d[0])-1):
        temp = []
        for j in range(0, len(d)):
            temp.append(float(d[j][i]))
        out.append(temp)
    return out

# gets mean (not really useful)
def getMean(d):
    from numpy import mean
    out = []
    for i in d:
        out.append(mean(i))
    return out

# gets SE (not really useful)
def getSE(d):
    from scipy.stats import sem
    out = []
    for i in d:
        out.append(sem(i))
    return out

if __name__ == '__main__':
    main()

