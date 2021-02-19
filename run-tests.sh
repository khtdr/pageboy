#!/usr/bin/env bash
cd "${0%'run-tests.sh'}" || {
  echo "cannot find the test suite"
  exit 1
}

# Tests are written with the pageboy-test shebang
ln -sf pageboy "pageboy-test"
echo -n "Running test suite for: "
./pageboy-test -h | grep "pageboy-v"

PATH=$PATH:$(pwd)
for t in ./tests/*.pb; do
  echo -n "$t ... "
  args="command line args"
  read -r expected <<< "$(tail -1 "$t" | sed 's/^#//')"
  read -r actual <<< "$("$t" "$args")"
  if [[ "$expected" == "$actual" ]]; then
    "$t" -c > "$t.sh"
    chmod +x "$t.sh"
    read -r compiled <<< "$("$t.sh" "$args")"
    rm "$t.sh"
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
