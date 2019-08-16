#!/bin/bash

source $(cd $(dirname $0) && pwd)/../libs/str.sh

strlen '1q2w3e4r5t6y7u8i9o0p' ## 10
strlen '!@#$%^&*()_+-=[]{}' ## 18
strlen '""' ## 2
strlen "''" ## 2

