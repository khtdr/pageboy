#!/usr/bin/env bash
cd ${0%'run-tests.sh'}
ln -s pageboy "pageboy-test"
export PATH=$PATH:$(pwd)
for t in ./tests/*; do
  echo -n "$t ... "
  read -r expected <<< "$(tail -1 $t | sed 's/^#//')"
  read -r actual <<< "$($t)"
  if [[ "$expected" == "$actual" ]]; then
    echo "passed"
  else
    echo "failed!"
    echo "  -expects [$expected]"
    echo "  -found [$actual]"
  fi
done
rm -f "pageboy-test"
