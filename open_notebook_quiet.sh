#!/bin/bash

outdir="_log/"

now=$(date +"%Y%m%d_%H%M")
outname="${outdir}out_${now}.txt"

# mkdir if not exist
mkdir -p $outdir

#nohup jupyter notebook --no-browser --port $PORTNUM > "$outname" 2>&1 &
nohup jupyter notebook --no-browser > "$outname" 2>&1 &

