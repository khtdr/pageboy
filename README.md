

<img align="right" src="https://raw.githubusercontent.com/khtdr/pageboy/master/logo.png" width="200" />

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
