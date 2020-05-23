for f in *.pdb.pdbqt; do 
    mv -- "$f" "${f%.pdb.pdbqt}.pdbqt"
done