#!/bin/bash

# lists all ssh connections, including the ones in the background.
# included a leading space to further filter the output.
# works in mac OS.

ps -A | grep " ssh"

