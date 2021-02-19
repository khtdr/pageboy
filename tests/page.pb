#!/usr/bin/env pageboy-test

$PAGEBOY -p bash2

#!/usr/bin/env php
<?php
for ($i=10; $i<=20; $i++) {
  echo $i . "\n";
}

#!/usr/bin/env ruby
5.times do
  puts "Hello, World! ~ruby1"
end


#!/bin/bash
echo "Hello, World! ~bash1"
whoami


#!/usr/bin/env bash
env


#!/usr/bin/env php
<?php
echo __DIR__;

# env
