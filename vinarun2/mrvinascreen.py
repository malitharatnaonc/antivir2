#! /usr/bin/env python

import sys
import glob
import pandas as pd


def doit(n):
    file_names = glob.glob('antivir*/*.pdbqt')
    everything = []
    failures = []
    print('Found', len(file_names), 'pdbqt files')
    for file_name in file_names:
        file = open(file_name)
        lines = file.readlines()
        file.close()
        try:
            line = lines[1]
            result = float(line.split(':')[1].split()[0])
            everything.append((result, file_name.split('/')[0]))
        except:
            failures.append(file_name)
    if n == -1:
        part = everything
    else:
        part = everything[:n]
    data = pd.DataFrame(part, columns=['affinity', 'name']).set_index('name')
    data.to_csv('highhits-full.csv')


if __name__ == '__main__':
    doit(int(sys.argv[1]))

