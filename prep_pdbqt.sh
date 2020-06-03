#! /bin/bash

for f in HBligs*.pdb; do
	b=`basename $f .pdbqt`
	echo Processing ligand $b
	pythonsh /Users/Shared/MGLTools/1.5.7/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py -l $f -o pdbqt/$b.pdbqt -A hydrogens
done

## changing the filenames to remove excess .pdb
cd pdbqt
for f in *.pdb.pdbqt; do 
    mv -- "$f" "${f%.pdb.pdbqt}.pdbqt"
done