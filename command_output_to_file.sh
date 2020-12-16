#!/bin/bash

# EXAMPLE:
#
# >> ./command_output_to_file.sh [conda env list]
#
# would produce conda_env_list.txt
#
# CAVEAT: if command contains non-standard characters like "=",
# it will be escaped like "\=" in the filename string
# and the filename will appear single-quoted in the file list.
# (on breeze: Ubuntu 18.04)


# join commands with underbars
OLD_IFS=$IFS
IFS="_"
outstr="$*"  # join with the first character of IFS
outname="${outstr}.txt"
IFS=$OLD_IFS 

outname=${outname//\'/}
echo "Saving to: ${outname}"

# first write the command on top
full_command="$*"  # this time join with spaces
echo "# ${full_command}" > $outname
echo "" >> $outname

# execute command and save stdout to the text file
"$@" >> $outname

