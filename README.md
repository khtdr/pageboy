
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

You can mix and match all you want. If your script uses valid [shebangs](https://en.wikipedia.org/wiki/Shebang_(Unix)), it will work. If it doesn't, it's a bug and [please let me know](https://github.com/khtdr/pageboy/issues).

installation & quickstart
-------------------------

1. Download the [pageboy bash script](https://raw.githubusercontent.com/khtdr/pageboy/v1.2.0/pageboy) and put into your `$PATH` (ie. `~/bin~)
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

feature guide
-------------

```bash
pageboy -h
```
>```
pageboy-v1.1.3
    pageboy            # runs as pageboy script
    pageboy -r <page>  # runs requested page
    pageboy -p <page>  # prints requested page
    pageboy -c         # compiles to bash script
    pageboy -d         # dumps page table
    pageboy -h         # shows this message
https://github.com/khtdr/pageboy
```

