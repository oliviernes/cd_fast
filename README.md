# cd_fast

#### Script to change directories quickly inside the terminal

### Summary:

This script's purpose is to find a directory and quickly change to this
 directory from the terminal.
 
### Requirements:

xclip:

sudo apt-get install xclip

### set up:

You can change the folder where the script begin to look for the
 directory's name by changing the parameter of the find command at line
 5 after (find). Replace ~/Documents/ by your choice.

### Usage:

Place the file cdf in a convenient place (ex: /home).

Then create an alias in your ```~/.profile``` (could be ```~/.bashrc```
 or ```~/.bash_profile```) like this one:

alias cdf='. ~/cdf'

You can then use the command cdf (the script accept the name of the
 directory as parameter):

cdf \<name_of_the_directory\>

Then follow instructions.

If there is only one directory maching the search, the script will cd 
inside right away.

***The search is case insensitive.***

### Advice:

Use wildcards like * to help you find your directory if you are using find command:

cdf *\<incomplete_name\>*

Your search must not have space inside in order to get the good results.



