#!/bin/bash

source $(cd $(dirname $0) && pwd)/../libs/url.sh

str='good 中国!'
echo "原始字符串: ${str}"                   ## good 中国!
encoded_str=$(urlencode "$str")
echo "编码字符串: ${encoded_str}"           ## good%20%e4%b8%ad%e5%9b%bd%21
decoded_str=$(urldecode "$encoded_str")
echo "解码字符串: ${decoded_str}"           ## good 中国!
