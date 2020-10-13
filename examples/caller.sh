#!/bin/bash

# just because example.sh is not in PATH
PATH=${PATH}:"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

example.sh -h

example.sh -b
example.sh --bool

example.sh -v hello
example.sh --val hello

example.sh -w world
example.sh --val_def world

example.sh -v "hello world"
example.sh --val "hello world"
