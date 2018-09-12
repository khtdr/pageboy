
<img align="right" src="https://raw.githubusercontent.com/khtdr/pageboy/master/logo.png" width="200" />

pageboy
=======

Write your shell scripts in any combination of languages you want. 

```bash
#!/usr/bin/env pageboy
# ... bash script for bash things

#!/usr/bin/perl
# ... perl script for perl things

#!/usr/bin/env ruby
# ... ruby script for whatever reason

```

#### tests
[![Build Status](https://travis-ci.org/khtdr/pageboy.svg?branch=master)](https://travis-ci.org/khtdr/pageboy)
```bash
> ./run-tests.sh
pageboy-v2.1.3
    ./pageboy-test            # runs as pageboy script
    ./pageboy-test -r <page>  # runs requested page
    ./pageboy-test -p <page>  # prints requested page
    ./pageboy-test -c         # compiles to bash script
    ./pageboy-test -d         # dumps page table
    ./pageboy-test -h         # shows this message
https://github.com/khtdr/pageboy
./tests/aliased.pb ... passed
./tests/args.pb ... passed
./tests/awk.pb ... passed
./tests/confusing.pb ... passed
./tests/dump.pb ... passed
./tests/lots.pb ... passed
./tests/named.pb ... passed
./tests/pageboy.pb ... passed
./tests/paths.pb ... passed
./tests/plain-bash.pb ... passed
./tests/print-php.pb ... passed
./tests/pwd.pb ... passed
./tests/run-php.pb ... passed
./tests/version.pb ... passed
```

You can mix and match all you want. If your script uses valid [shebangs](https://en.wikipedia.org/wiki/Shebang_(Unix)), it will work. If it doesn't, it's a bug and [please let me know](https://github.com/khtdr/pageboy/issues). It also supports the (not quite right) awk shebang: `#!/usr/bin/env awk`.

installation & quickstart
-------------------------

1. Current version: 2.1.3
1. Download the [pageboy bash script](https://raw.githubusercontent.com/khtdr/pageboy/v1.2.3/pageboy) and put into your `$PATH` (ie. `~/bin/`).
2. Start using `#!/usr/bin/env pageboy` as your shebang line in your bash scripts.
2. Call other "pages" of your script by using the pre-defined `$PAGE` command in your scripts.

```bash
#!/usr/bin/env pageboy
$PAGE php | wc

#!/usr/bin/env php
<?php
phpinfo();
```

>```
     934    3524   29671
```

You can have as many "pages" in your script as you wish.

- If you want multiple pages of the same language, append an index,
  starting at 1, to the pagename.
- If you want to distribute your script, you can compile to bash
  with the `-c` flag.
  - The compiled output will behave the same,
    but without the dependency on pageboy.

```bash
#!/usr/bin/env pageboy
cat <($PAGE php) <($PAGE ruby) <($PAGE bash1) <($PAGE bash2) <($PAGE php2)

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
echo "Hello, World! ~bash2"
whoami

#!/usr/bin/env bash
env | grep TERM

#!/usr/bin/env php
<?php
echo __DIR__;
```

>```
10
11
12
13
14
15
16
17
18
19
20
Hello, World! ~ruby1
Hello, World! ~ruby1
Hello, World! ~ruby1
Hello, World! ~ruby1
Hello, World! ~ruby1
Hello, World! ~bash2
khtdr
TERM_PROGRAM=iTerm.app
TERM=xterm-256color
ITERM_PROFILE=Default
ITERM_SESSION_ID=w0t0p0
/home/khtdr/
```

:bulb: __You want to send this script to a colleague__

`my_pageboy_script.sh -c | mail colleague@example.com`






feature guide
-------------

```bash
pageboy -h
```

>```
pageboy-v2.1.3
    pageboy            # runs as pageboy script
    pageboy -r <page>  # runs requested page
    pageboy -p <page>  # prints requested page
    pageboy -c         # compiles to bash script
    pageboy -d         # dumps page table
    pageboy -h         # shows this message
https://github.com/khtdr/pageboy
```

Examples can be found in the `scripts` directory.

__todo__ show a good example for each use case


advanced features
-----------------

  - Pages can be named, see https://github.com/khtdr/pageboy/blob/master/tests/named.pb
  - Args can be passed in, see https://github.com/khtdr/pageboy/blob/master/tests/args.pb

### 
