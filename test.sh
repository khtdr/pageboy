#!/usr/bin/env bash
cd ${0%'test.sh'}
ln -sf pageboy "pageboy-test"
./pageboy-test -h
export PATH=$PATH:$(pwd)
for t in ./scripts/test-*.sh; do
  echo -n "$t ... "
  read -r expected <<< "$(tail -1 $t | sed 's/^#//')"
  read -r actual <<< "$($t)"
  if [[ "$expected" == "$actual" ]]; then
    echo "$($t -c)" > $t.compiled
    chmod +x $t.compiled
    read -r compiled <<< "$($t.compiled)"
    rm $t.compiled
    if [[ "$actual" == "$compiled" ]]; then
      echo "passed"
    else
    echo "compiled output does not match!"
    echo "  -pageboy [$actual]"
    echo "  -compiled[$compiled]"
    fi
  else
    echo "failed!"
    echo "  -expects [$expected]"
    echo "  -found [$actual]"
  fi
done
rm -f "pageboy-test"
