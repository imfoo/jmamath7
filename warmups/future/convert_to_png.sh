for i in $(seq 1 120); do
    warmupno=`printf "%03d" $page`
    convert -density 300 -quality 85 7thGradeMathWarmUp${warmupno}.pdf 7thGradeMathWarmUp${warmupno}.png
done
