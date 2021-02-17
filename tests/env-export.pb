#!/usr/bin/env pageboy
export PHP_ENV=test
$PAGE php

#!/usr/bin/env php
<?php
echo getenv('PHP_ENV');

# test
