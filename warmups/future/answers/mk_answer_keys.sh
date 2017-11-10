for i in $(seq 1 10); do
    sed -n "${i}{p;q}" ../answers.md | sed -n "s/^\([0-9]\+\))/# Answers/p" | sed -n "s/\([1-5]\))/\n\1./gp" > ${i}.md
done
