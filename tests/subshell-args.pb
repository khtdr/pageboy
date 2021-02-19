#!/usr/bin/env pageboy-test

cat <($PAGE ONE) | `$PAGE CHAR_COUNT`

#!/usr/bin/env php #ONE
<?php

$args = getenv("PAGEBOY_ARGS");
echo "PHP #ONE $args\n";

#!/usr/bin/env bash #CHAR_COUNTER
#echo "wc -c"
echo "echo"

#
