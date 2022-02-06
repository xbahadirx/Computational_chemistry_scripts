#!/bin/bash

#by Bahadır ALTINTAŞ
#extracts the k-vectors fron QuantumEspresso band calculations for given pressure
#usage : kvecs.sh PREFIX PRESSURE
PREFIX=$1
PRESS=$2
for p in $PRESS;
do
grep high $PREFIX.GPa$p.bands.out |awk '{print $8}' > $PREFIX.GPa$p.bands.kvecs
grep Fermi $PREFIX.GPa$p.scf.out |awk '{print $5}' > $PREFIX.GPa$p.bands.fermi
~/my_scripts/bandgap.py -o $PREFIX.GPa$p.scf.out | grep 'GAP' |awk '{print $4}' > $PREFIX.GPa$p.bands.gap
done
