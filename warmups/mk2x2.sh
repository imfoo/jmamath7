for page in $(seq 1 120); do
    warmupno=`printf "%03d" $page`
    filename="7thGradeMathWarmUp$warmupno.pdf"
    pdfnup --no-landscape --nup 2x2 --suffix '2x2' $filename $filename $filename $filename
done
