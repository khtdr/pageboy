#!/usr/bin/env pageboy-test
a=$(echo `$PAGEBOY -r bash1` "+" $($PAGEBOY -r bash2) | bc)
b=$(echo `$PAGE bash1` "+" $($PAGE bash2) | bc)
c=$(echo `./aliased.sh -r bash1` "+" $(./aliased.sh -r bash2) | bc)

echo $a "+" $b "+" $c | bc

#!/bin/bash
echo 100

#!/bin/bash
echo 23

# 369
