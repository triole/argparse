#!/bin/bash

# just to make sure argparse is in path for this example
PATH=${PATH}:"$(echo $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) | grep -Po ".*(?=\/)")/src"

# below how to argparse: first arg declaration, second usage

#ap_ b,bool; desc=boolean value, true or false
#ap_ v,val; desc=value that can take argument
#ap_ lbool; desc=boolean value with long arg only
#ap_ lval; desc=value with long arg only
#ap_ w,dval; desc=value taking argument, having default one; default=world
#ap_ nodesc;

. argparse "${0}" "${@}"
dump_args
