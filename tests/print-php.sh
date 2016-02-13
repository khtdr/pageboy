#!/usr/bin/env pageboy-test
./print-php.sh -p php | grep -A1 4 | tail -1

#!/usr/bin/env php
<?php
echo "100\n";
echo "200\n";
echo "300\n";
echo "400\n";
echo "500\n";
echo "600\n";
echo "700\n";
echo "800\n";
echo "900\n";

# echo "500\n";
