#!/bin/bash

HOSTNAME=$1

# match default port number
case $HOSTNAME in

    node1-2)
        PORT_DEF=9999
        ;;
    
    virga-05)
        PORT_DEF=8851
        ;;

    breeze)
        PORT_DEF=8101
        ;;
    
    *)
        echo "warning: unknown host"
        PORT_DEF=8888
        ;;
esac

PORTNUM=${2:-$PORT_DEF}

# to connect to remove notebook server
# syntax: [local_port]:localhost:[remote_port]

ssh -f -N -L ${PORTNUM}:localhost:${PORTNUM} $HOSTNAME

# NOTE:
# -f to make background
# -N to not open a shell
#
# now the ssh is in the background. to view the list of ssh connetions do
# > ps -A | grep ssh
# (on a mac OS)

# then open browser and go to
# `localhost:[local_port]`

