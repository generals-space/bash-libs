#!/bin/bash

source $(cd $(dirname $0) && pwd)/../libs/str.sh

#########################################################
## strlen

strlen '1q2w3e4r5t6y7u8i9o0p' ## 10
strlen '!@#$%^&*()_+-=[]{}' ## 18
strlen '""' ## 2
strlen "''" ## 2

#########################################################
## strcontains

strcontains abcd ab ## 1
strcontains abcd abd ## 0
strcontains "hello world" "hello"  ## 1
strcontains "hello world" "hello w"  ## 1
strcontains "hello world" "hello x"  ## 0

#########################################################
## strstartwith

strstartwith abcd a  ## 1
strstartwith abcd ab  ## 1
strstartwith abcd b  ## 0
strstartwith abcd bc  ## 0
strstartwith "hello world" "hello"  ## 1
strstartwith "hello world" " hello"  ## 0

#########################################################
## strendwith

strendwith abcd d  ## 1
strendwith abcd cd  ## 1
strendwith abcd a  ## 0
strendwith abcd ab  ## 0
strendwith "hello world" "world"  ## 1
strendwith "hello world" "world "  ## 0

#########################################################
## strupper

strupper abcd ## ABCD
strupper abCD ## ABCD
strupper "hello world" ## HELLO WORLD
strupper "Hello World" ## HELLO WORLD
strupper "Hello World@#$%^&*()_+-=[]{},.<>/?" ## HELLO WORLD@#$%^&*()_+-=[]{},.<>/?
strupper "世界 你好" ## 世界 你好
## 注意: 双引号包裹的英文感叹号!会被转义, 但这并不是脚本问题, 而bash本身的机制.
strupper "Hello World!" ## HELLO WORLD
strupper 'Hello World!' ## HELLO WORLD!

#########################################################
## strlower

strlower ABCD ## abcd
strlower abCD ## abcd

#########################################################
## strslice
strslice 'hello world' 0 5      ## hello
strslice 'hello world' 0 11     ## hello world
strslice 'hello world' 0 -3     ## hello wo
strslice 'hello world' -5 -3    ## wo

#########################################################
## strsub

strsub 'hello world' 0 5        ## hello
#########################################################
## strrsub

strrsub 'hello world' 5 5        ## world
