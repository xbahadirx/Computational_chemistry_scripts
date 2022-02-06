#!/bin/bash
PREFIX="ZrO2_189"
rm coords.$PREFIX/energies.$PREFIX
for p in 0 25 50 75 100 125 150 175 200;
do
grep ! results/$PREFIX.relax.GPa$p.out  | tail -1 | awk '{print "'"$p"'" " " $5}' >> coords.$PREFIX/energies.$PREFIX
done
