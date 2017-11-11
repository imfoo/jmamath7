#!/bin/sh
for file in `ls -1 *.html`; do
    cat ${file} | sed -e 's/window.print();//p' > ${file}.out
    mv ${file}.out ${file}
done
