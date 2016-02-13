#!/usr/bin/env pageboy-test

echo $(echo "$(./lots.sh -r php | sed 's/$/+/')0" | tr -d "\n\r") | bc

#!/usr/bin/env php
<?php
for ($i=10; $i<=20; $i++) {
  echo $i . "\n";
}

# 165
