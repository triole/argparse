# Argparse

<!--- mdtoc: toc begin -->

1.	[Synopsis](#synopsis)
2.	[Arg parser logic](#arg-parser-logic)
3.	[Usage](#usage)<!--- mdtoc: toc end -->

## Synopsis

A bash arg parser purely written in shell heavily relying on standard Linux shell tools. Most importantly `grep` for string parsing.

It supports default values but is far from complete and only exists because I needed a simple low level cli arg parser that is easy to use and does not open a whole new toolbox.

I use it with `bash` only. That's why I have no idea how it behaves in other shells like `Fish` or `zsh`.

## Arg parser logic

A cli arg can have three different values: a set one, a default one or empty.

1.	If the arg `-b` is used argparse creates a variable called `args_b` being `true`

2.	If you use `-b hello` the variable has the value `hello`

3.	If `-b` is a specified argument but but does not occur as a flag argparse makes a variable `arg_b` but being empty. If you like boolean values you can give it a default value `false` which will be set to true if `-b` occurs in as an arg.

## Usage

Available arguments are declared in comments in your shell script. The relevant lines need to start with `#ap_`. Their position does not matter. They can be placed anywhere inside the script.

A line's first part contains a short or long name of an arg or just one of these. Afterwards a description and default value can be declared in a kind of key value structure.

Looking like this for example:

```shell
#ap_ b,bool; desc=boolean value, true or false
#ap_ v,val; desc=value that can take argument
#ap_ lbool; desc=boolean value with long arg only
#ap_ lval; desc=value with long arg only
#ap_ w,dval; desc=value taking argument, having default one; default=world
#ap_ nodesc;

. argparse "${0}" "${@}"

# to check available argparse variables
dump_args
```

Help switches `-h` and `--help` do not need to be added to the declaration. They are available by default and display the help obviously.
