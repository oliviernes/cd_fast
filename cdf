#!/bin/bash

#display first message:

echo -e "Search for directory $1 and change directory\n"

<<COMMENT
use find or locate commands to look for directories
use iname parameter to search case insensitive
use xclip to copy paste the result
COMMENT

#Choose between find and locate to search your folder:
#locate is faster but you need to launch updatedb to update
#the folders'paths.

#With finds:
#find ~/Documents/ -iname $1 -type d | xclip

#With locate (beware to adapt the regex if your name's folders include other characters):
#-i option is to ignore case distinctions when matching patterns.
locate --regex -i ^\/home\/$USER\/Documents[a-z,A-Z,1-9,_,\ ,-,\/]*$1[a-z,A-Z,1-9,\ ,_,-,]*$ | xclip

pathcd=`xclip -o`

path1=""

let "a=0"
let "b=0"
let "c=0"    
array=()

#Loop in the result of the find command to build the paths's array:

for i in $pathcd; do
    if [ ${i:0:1} == "/" ] && [ "${a}" -eq "${b}" ];
    then
        path1="${path1}${i}"
        let "a=a+1"
    elif [ ${i:0:1} != "/" ];
    then
        path1="${path1} ${i}"
    elif [ ${i:0:1} == "/" ] && [ "${a}" -ne "${b}" ];
    then
        array[${c}]="${path1}"
        path1=""
        path1="${path1}${i}"
        let "c=c+1"
    fi
done

#Add the last path to the array:

array[${c}]="${path1}"

#use if sentences to cd right away or ask the path to follow:

if [ "${array[@]}" == "" ];
then
    echo "No directory with this name. Try again."
elif [ ${#array[@]} = 1 ];
then
    wayd=\"${array[0]}\"
    echo $wayd
    eval cd $wayd
else
    echo -e "Choose which way you want to go:\n"

    let "d=0"

    for val in "${array[@]}"
    do
        let "d=d+1"
        way="${d}-${val}"
        echo $way
    done

    read waycd
    let "waycd=waycd-1"

    wayd=\"${array[${waycd}]}\"
    eval cd $wayd
fi
