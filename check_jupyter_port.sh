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
fi

# some code that only runs if port is specified

