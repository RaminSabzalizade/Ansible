#!/bin/bash

for i in {1..10}
do
    echo "running test $i"
    ./test.sh
done
echo "done"
