#!/bin/bash

#by Bahadır ALTINTAŞ
#Bash script to extract optimized coordinates from QuantumEspresso geometry optimization output file with given PREFIX eg "ZrO2_189"

PREFIX="ZrO2_189"
for p in 0 ;
do
rm $PREFIX.GPa$p.coord
grep -A15 CELL results/$PREFIX.relax.GPa$p.out | tail -16  >> tmp.coord
sed '/End final coordinates/d' tmp.coord >> $PREFIX.GPa$p.coord
rm tmp.coord
done
