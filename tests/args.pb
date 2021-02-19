#!/usr/bin/env pageboy-test

# The command line args are passed in from the test runner
echo -n $PAGEBOY_ARGS" "
$PAGE php

#!/usr/bin/env php
<?php

$args = getenv("PAGEBOY_ARGS");
echo serialize($args);

# command line args s:17:"command line args";
