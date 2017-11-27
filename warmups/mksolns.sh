for page in $(seq 43 49); do
    sed -e 's/35/'${page}'/' solutions_35.rem > solutions_${page}.rem
done
