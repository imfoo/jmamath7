#!/bin/bash
for n in $(seq 80 84); do
    warmupno=`printf "%03d" $n`
    mkdir ~/git/wwjmamath7/warmup${warmupno}
    cp future/7thGradeMathWarmUp${warmupno}.png ~/git/wwjmamath7/warmup${warmupno}/warmup${warmupno}.png
#    cat future/answers/${n}.md
    for (( i=1; i<=5; i++ )); do
        ans=$(awk "/^${i}/ {for (j=2; j<NF; j++) printf \$j \" \"; print \$NF}" future/answers/${n}.md)
        ANS[i-1]=$(echo ${ans} | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')
#        echo ${ANS[i-1]}
#        echo ${ans}
    done
    #sedparams="-e 's/WARMUPNO/'${warmupno}'/' -e 's/ANS1/'${ANS[0]}'/' -e 's/ANS2/'${ANS[1]}'/' -e 's/ANS3/'${ANS[2]}'/' -e 's/ANS4/'${ANS[3]}'/' -e 's/ANS5/'${ANS[4]}'/'"
    sed -e "s/WARMUPNO/${warmupno}/" -e "s/ANS1/${ANS[0]}/" -e "s/ANS2/${ANS[1]}/" -e "s/ANS3/${ANS[2]}/" -e "s/ANS4/${ANS[3]}/" -e "s/ANS5/${ANS[4]}/" wwwarmup_tmpl.pg > ~/git/wwjmamath7/warmup${warmupno}/${warmupno}.pg
    #echo ${sedparams}
    #sed -e 's/WARMUPNO/'${warmupno}'/' -e 's/ANS1/'${ANS[0]}'/' -e 's/ANS2/'${ANS[1]}'/' -e 's/ANS3/'${ANS[2]}'/' -e 's/ANS4/'${ANS[3]}'/' -e 's/ANS5/'${ANS[4]}'/' solutions_35.rem > solutions_${page}.rem
done

