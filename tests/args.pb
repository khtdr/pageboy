#!/usr/bin/env pageboy-test

$PAGE php

#!/usr/bin/env php
<?php

$args = getenv("PAGEBOY_ARGS");
echo serialize($args);

# s:0:"";
