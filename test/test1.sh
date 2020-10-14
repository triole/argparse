#!/bin/bash

source lib.sh

PATH=${PATH}:"$(echo $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) | grep -Po ".*(?=\/)")/src"

#ap_ d,debug; desc=bool, no default
#ap_ b,bool; desc=bool; default=false
#ap_ s;set; desc=whatever value;
#ap_ t;text; desc=whatever text; default="default text"

echo -e "\n\033[0;93mCall\033[0m $(basename "${0}") ${@}"
. argparse "${0}" "${@}"

assert_eq "${args_debug}" "true"
assert_eq "${args_bool}" "false"
