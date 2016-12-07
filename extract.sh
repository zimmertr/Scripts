#!/bin/bash
#####################################################################
#####################################################################
##extract.sh is a shell script used to extract archives without the##
##need of passing any parameters or remembering the utility. I     ##
##simply have to type $extract filename and as long as it is one of##
##the common archive types (.zip, .rar, .7z, .tar, .tar.gz) the    ##
##file will be extracted successfully. It also gives you the option##
##to provide the location of the directory for the extraction. If  ##
##enter is pressed with a blank field at this stage, it simply uses##
##the working directory as the extraction location.                ##
#####################################################################
#####################################################################

#Set the name of archive.
name="$1"

#Make sure it's a regular file and assign it to name.
[[ -f $name ]]
name="$(readlink -f "$name")"

#Prompt for extraction location, or push enter for current directory.
read -p "Extraction location (Enter for current): " location
[[ -z $location ]] && location="."

#Change to given directory.
cd "$location"

#extract the archive given the specific file extension.
case "$name" in
*.zip) unzip "$name" ;;
*.rar) unrar e "$name" ;;
*.7z) 7z x "$name" ;;
*.tar) tar xf "$name" ;;
*.tar.gz) tar xzf "$name" ;;
*) echo "Not part of the script. Add it!" ;;
esac
