#!/usr/bin/env pageboy-test
cat <($PAGE php) <($PAGE ruby) <($PAGE bash1) <($PAGE B2) <($PAGE MYPHP)

#!/usr/bin/env php
<?php
echo "PHP1";

#!/usr/bin/env ruby
print "RUBY1"

#!/bin/bash
echo -n "BASH1"

#!/usr/bin/env bash #B2
echo -n "B2"

#!/usr/bin/env php #MYPHP
<?php
echo "MYPHP";

# PHP1RUBY1BASH1B2MYPHP
