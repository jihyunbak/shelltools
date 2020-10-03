#!/bin/bash

# check port number
CONFIG_FILE="${HOME}/.jupyter/jupyter_notebook_config.py"
if [ -f $CONFIG_FILE ]; then
    LINE=$( grep '^c.NotebookApp.port' ${CONFIG_FILE} --color=always )
    if [[ $LINE ]]; then
        echo $LINE
    else
        # require that port number is specified
        echo "port number not specified - notebook is not open."
        exit 1
    fi
fi

outdir="_log_nb/"

# mkdir if not exist
mkdir -p $outdir

now=$(date +"%Y%m%d_%H%M")
outname="${outdir}out_${now}.txt"

#nohup jupyter notebook --no-browser --port $PORTNUM > "$outname" 2>&1 &
nohup jupyter notebook --no-browser > "$outname" 2>&1 &

