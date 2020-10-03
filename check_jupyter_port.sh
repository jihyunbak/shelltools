#!/bin/bash

# check port number
CONFIG_FILE="${HOME}/.jupyter/jupyter_notebook_config.py"
if [ -f $CONFIG_FILE ]; then
    LINE=$( grep '^c.NotebookApp.port' ${CONFIG_FILE} --color=always )
    if [[ $LINE ]]; then
        echo $LINE
    else
        echo "port number not specified."
        exit 1
    fi
else
    echo "jupyter notebook config not found."
    # generate it by doing jupyter notebook --generate-config
    # and modify the line: # c.NotebookApp.port = 8888.
    exit 1
fi

# some code that only runs if port is specified

