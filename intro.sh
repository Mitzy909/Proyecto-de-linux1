!/bin/bash

pistolaarriba="\n\n                                         |\n                                         |\n                                         |\n                               >

bala=">>>>"

espacios="                +0*1*0+"

pistolaabajo="\n  + ++++++++++++++                    +00000+\n  +   ++                              +++++++\n  ++++\n\n\n"


for ((i=0; i<20; i++)); do      
        clear
        echo -en "$pistolaarriba"
        for ((j=0; j<i; j++)); do
                echo -en " "

        done
        espacios=${espacios:1}
        echo -en "$bala"
        echo -en "$espacios"
        echo -e "$pistolaabajo"
        sleep 0.2
done

img1="

                                         |

                                      + + + +
  + + + + + + + + +                   + 0 0 + 
  +               +                   > > * +
  + + + + + + + +                     + 0 0 +
  +   +                               + + + + 
  + + 

"
img2="
                                         |

                                         |
                                       + + +
   + + + + + + + + +                   0 0 0 
                 +                     > > 0
     + + + + + + +                     0 0 0
       +                               + + +
   + +

"
booleano=true

for ((i=0; i<2000; i++)); do
        clear

        sleep 0.0003
        if [ $booleano = true ]; then
                echo -en "$img1"

                booleano=false
        else
                echo -en "$img2"
                booleano=true

        fi
done







