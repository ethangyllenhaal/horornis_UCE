#!/usr/bin/env python

'''
Made by Ethan Gyllenhaal (egyllenhaal@unm.edu)
Last updated: A long time ago (prior to writing this)

NOTE: Don't judge me, this was a rushed little script so I followed like zero good practices.
Only really useable in tandem with way I ran fastsimcoal.
I am well aware there are better ways to do it.

Primitive script for processing fastsimcoal output. Assumes only text files are output form the way I did it in Horornis paper.
For a given file, prints a header and the best fit data.
Also prints mean and stDev of runs, but that doesn't really mean much for analysis. Figured I'd leave it in there.

No arguments, assumes directory structure is how I set it up @_@.
'''

def main():
    import csv
    head = getHeader()
    data = getData()
    flip = getFlip(data)
    sterr = getSE(flip)
    mean = getMean(flip)
    reps = len(data)
    maxL = len(data[0])-2
    best = 0
    for i in range(0,reps):
        if float(data[i][maxL]) > float(data[best][maxL]):
            best = i
    print('\t'.join([str(x) for x in head]))
    print('\t'.join([str(x) for x in data[best]]))
    print('\t'.join([str(x) for x in mean]))
    print('\t'.join([str(x) for x in sterr]))

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

def getFlip(d):
    from scipy.stats import sem
    out = []
    for i in range (0, len(d[0])-1):
        temp = []
        for j in range(0, len(d)):
            temp.append(float(d[j][i]))
        out.append(temp)
    return out

def getMean(d):
    from numpy import mean
    out = []
    for i in d:
        out.append(mean(i))
    return out

def getSE(d):
    from scipy.stats import sem
    out = []
    for i in d:
        out.append(sem(i))
    return out

if __name__ == '__main__':
    main()

