#!/bin/bash

# urlencode <string>
## @function: 转义目标url $1中的非法字符, 
##            功能等同于js中的encodeURI, 
##            python中的urllib.parse.quote
## $1:        目标url字符串.
## @return:   结果以echo形式返回
function urlencode() 
{
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=en_US.utf8
    ## 取字符串长度
    local length="${#1}"
    ## 循环遍历其中的每个字符, 对部分ascii字符区别对待.
    local result=''
    for (( i = 0; i < length; i++ )); do
        ## 获取字符串中第i个字符
        local c="${1:i:1}"
        local _str=''
        case $c in
            ## 不转义如下字符
            [a-zA-Z0-9.~_-]) 
                _str=$(echo -n "$c")
                ;;
            ## 其他字符都转义
            ## printf不能将中文字符转换成16进制, 所以这里仍然使用xxd命令
            ## *) printf '%%%02X' "'$c" ;;
            *) 
                ## sed将字符串中每两个字符前加上%, 如: aabb->%aa%bb
                _str=$(echo -n "$c" | xxd -plain | sed 's/\(..\)/%\1/g') 
                ;;
        esac
        result=${result}${_str} ## 字符串拼接
    done
    LC_COLLATE=$old_lc_collate
    echo $result
}

## @function: 解码%xx形式的字符串$1
## @return:   结果以echo形式返回
function urldecode() 
{
    ## 这句是借助{}将$1中传入的字符串中的加号+转换成空格, 有什么意义吗?
    ## local url_encoded="${1//+/ }"

    ## 将%xx转换成\xxx, 直接打印.
    ## 进制为%b, 二进制直接输出, 可以自动组合成中文.
    ## printf与echo都可以
    ## printf '%b' "${1//%/\\x}"
    echo -en "${1//%/\\x}"
}
