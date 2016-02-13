
<img align="right" src="https://raw.githubusercontent.com/khtdr/pageboy/master/logo.png" width="200" />

pageboy
=======

Write your shell scripts in any combination of languages you want. 

```bash
#!/usr/bin/env pageboy

# TODO: prompt use for information
#       send data to ruby script for processing
#       pipe the results into the perl script for formatting

#!/usr/bin/env ruby
# ...

#!/usr/bin/perl
# ...

```

You can mix and match all you want. If it uses a valid [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)), it will work. If it doesn't, it's a bug so [please let me know](https://github.com/khtdr/pageboy/issues).

installation & quickstart
-------------------------

1. [download](/) and put into your `$PATH`, somewhere like `/home/$USER/bin/pageboy`
2. [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) away with `#!/usr/bin/env pageboy`

```bash
#!/usr/bin/env pageboy
echo "Hello, World!"
```
>```
Hello, World!
```

user guide
----------

:bulb: check for help information

```bash
pageboy -h
```
>```
pageboy-v1.1.2
                # runs as pageboy script
     -r <page>  # runs requested page
     -p <page>  # prints requested page
     -c         # compiles to bash script
     -d         # dumps page table
     -h         # shows this message
https://github.com/khtdr/pageboy
```

tests have many examples for now
