#!/usr/bin/env bats

source ../src/argparse

@test "get_names" {
    [[ $(get_long_name "d,debug; desc=enable debug mode") == "debug" ]]
    [[ $(get_short_name "d,debug; desc=enable debug mode") == "d" ]]

    [[ $(get_long_name "d; desc=enable debug mode") == "d" ]]
    [[ $(get_short_name "d; desc=enable debug mode") == "d" ]]

    [[ $(get_long_name "debug; desc=enable debug mode") == "debug" ]]
    [[ $(get_short_name "debug; desc=enable debug mode") == "debug" ]]
}

@test "get_val" {
    [[ $(get_val "desc" "d,debug; desc=enable debug mode") == "enable debug mode" ]]
    [[ $(get_val "desc" "v,val; desc=any value") == "any value" ]]
}

@test "get_arg_val" {
    [[ $(get_arg_val "script.sh;-b;" "b" "bool") == "true" ]]
    [[ $(get_arg_val "script.sh;-v;hello;-d" "v" "val") == "hello" ]]
    [[ $(get_arg_val "script.sh;-b;--bool;-v;hello;" "b" "b") == "true" ]]
    [[ $(get_arg_val "script.sh;-v;hello world;" "v") == "hello world" ]]

    [[ $(get_arg_val "script.sh;-v;hello;" "b") == "" ]]
    [[ $(get_arg_val "script.sh;-b;" "c" "char") == "" ]]
    [[ $(get_arg_val "script.sh;-b;" "c") == "" ]]
    [[ $(get_arg_val "script.sh;-b;" "char") == "" ]]
}
