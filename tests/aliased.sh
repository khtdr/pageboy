#!/usr/bin/env pageboy-test
a=$(echo `$PAGEBOY -r bash1` "+" $($PAGEBOY -r bash2) | bc)
b=$(echo `$PAGE bash1` "+" $($PAGE bash2) | bc)

echo $a "+" $b | bc

#!/bin/bash
echo 100

#!/bin/bash
echo 23

# 246
