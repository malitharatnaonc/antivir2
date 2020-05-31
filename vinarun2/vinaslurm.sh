#! /bin/bash

#SBATCH --nodes=1
#SBATCH --time=2-00:00
#SBATCH --qos=debug
#SBATCH --partition=test
#SBATCH --ntasks=1
#SBATCH --job-name=viraltest
#SBATCH --output=viralscreen.%j.log

for f in pdbqt/antivir*.pdbqt; do
    b=`basename $f .pdbqt`
    printf "\n\n"
    echo Processing ligand $b
    mkdir -p $b
    vina --config config.txt --ligand $f --out ${b}/out.pdbqt --log ${b}/log.txt
done
