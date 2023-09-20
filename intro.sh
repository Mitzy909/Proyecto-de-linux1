#!/bin/bash

pistolaarriba="  ++++++++++++++++++     \n  +              ++"

bala="++++"

pistolaabajo="\n  + ++++++++++++++\n  +   ++\n  ++++"


for ((i=0; i<20; i++)); do      
        clear
        echo -en "$pistolaarriba"
        for ((j=0; j<i; j++)); do
                echo -en " "
        done
        echo -en "$bala"
        echo -e "$pistolaabajo"
        sleep 0.2
done




