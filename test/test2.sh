#!/bin/bash

source lib.sh

PATH=${PATH}:"$(echo $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) | grep -Po ".*(?=\/)")/src"

#ap_ d,debug; desc=bool, no default
#ap_ b,bool; desc=bool; default=false
#ap_ s;set; desc=whatever value;
#ap_ t;text; desc=whatever text; default="default text"

. argparse "${0}" "${@}"

assert_empty "${args_debug}"
assert_eq "${args_bool}" "true"
