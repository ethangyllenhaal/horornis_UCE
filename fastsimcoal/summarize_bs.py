def main():
    import csv
    data = getData()
    flip = getFlip(data)
    reps = len(data)
    maxL = len(data[0])-2
    best = 0
    for i in range(0,reps):
        if float(data[i][maxL]) > float(data[best][maxL]):
            best = i
    print('\t'.join([str(x) for x in data[best]]))

def getData():
    import csv
    import fnmatch
    import os
    name = boot_runs.txt
    data=[]
    with open(name) as text:
        database = csv.reader(text, delimiter='\t')
        next(database, None)
        for line in database:    
            data.append(line)
    return data

def getFlip(d):
    from scipy.stats import sem
    out = []
    for i in range (0, len(d[0])-1):
        temp = []
        for j in range(0, len(d)):
            temp.append(float(d[j][i]))
        out.append(temp)
    return out

if __name__ == '__main__':
    main()

