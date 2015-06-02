#!/bin/bash

#Copyright [2015] [Jason Clark]

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

    #http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

VERSION=0.8.15
MODELDIR="src/view/"


function help()
{
    echo ""
    echo "Chicago Boss View Generator by Jason Clark <mithereal@gmail.com>"
    echo "\n"
    echo "-n controller name"
    echo "\n"
    echo " -p property1,property2,property3"
    echo "\n"
    echo " -d the projects base directory"
}


-compile(export_all).
 
    
function create(){
	init
	echo "-module($NAME_controller, [Req])." > $BASEDIR$MODELDIR$FILENAME
    echo "-compile(export_all)." >> $BASEDIR$MODELDIR$FILENAME
    echo "" >> $BASEDIR$MODELDIR$FILENAME
    echo "%% @doc show a \"Hello World\" message" >> $BASEDIR$MODELDIR$FILENAME
    echo "index('GET', []) ->" >> $BASEDIR$MODELDIR$FILENAME
    echo "    {output, \"Hello World\"}." >> $BASEDIR$MODELDIR$FILENAME

}


function init()
{
    if [ -z "$BASEDIR" ]
then
  BASEDIR="./"

fi

if [ ! -d "$BASEDIR$MODELDIR" ]
	then
	echo "$BASEDIR is not a Chicagoboss Project" 
	exit
    fi

 if [ -z "$NAME" ]
then
echo "Enter the model name"
read NAME
FILENAME=${NAME}
FILENAME+=".erl"
fi

 if [ -z "$PROPLIST" ]
then
 echo "Enter the model properties"
read PROPLIST

fi

##FIXME add logic to make sure / is behind BASEDIR then we can remove / from start of MODELDIR
#if [[ "$BASEDIR" =~ '/'$ ]]; then 
  #BASEDIR=${BASEDIR};
  #else
  #BASEDIR+= "/"
#fi

}

while getopts ":?:p:n:d" opt; do
    case $opt in
    
		d)
		BASEDIR=$OPTARG
            ;;
		n)
		NAME=$OPTARG
            ;;
       -p)
        PROPLIST=$OPTARG
            ;;
        ?)
            help
exit 0
            ;;
    esac
done

create
