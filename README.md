# cd_fast
Script to change directories quickly inside the terminal

Summary:

This script's purpose is to find a directory and quickly change to this
 directory from the terminal.
 
Requirements:

xclip:

sudo apt-get install xclip

set up:

You can change the folder where the script begin to look for the
 directory'name by changing the parameter of the find command at line 5
 after (find). Replace ~/Documents/ by your choice.

Usage:

Place the file cd in a convenient place (ex: /home)

The script accept the name of the directory as parameter:

. cd \<name of the directory\>

then follow instructions.

If there is only one directory maching the search, the script will cd 
inside right away.

***The search is case insensitive.***

Advice:

Use wildcards like * to help you find your directory:

. cd *\<incomplete name\>*





