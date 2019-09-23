#!/bin/bash

## @function: 计算指定字符串的长度
function strlen() 
{
    ## 1. wc 的-L选项, 直接获取当前行的字符数
    echo $1 | wc -L
    ## 2. ${}方法, 把字符串变量当作是数组处理
    ## local str=$1
    ## echo ${#str}
    ## 3. awk内置的length()函数
    ## echo $1 | awk '{print length($0)}'
    ## 4. expr内置lenght无法处理变量中存在空格的情形, 放弃使用
}

## @function: 移除参数$1左右两侧的空白字符
function strtrim()
{

}
function strltrim()
{

}
function strrtrim()
{

}
## @function: 判断$2是否为$1的子字符串, 即$1是否包含$2.
## @note:     bash中花括号的高级应用, 判断从$1开始处是否可以匹配到`*$2*`, `*`为通配符.
##            是, 则从$1左侧移除匹配的部分并返回剩下的部分, 否则直接返回$1.
##            另外注意包裹的双引号.
## @return:   结果以echo方式返回
function strcontains()
{
    if [ "${1#*$2}" = "$1" ]; then
        echo 0
    else 
        echo 1
    fi
}
## @function: 判断$1是否以$2起始
## @return:   结果以echo方式返回
function strstartwith()
{
    if [[ "${1#$2}" = "$1" ]]; then
        echo 0
    else 
        echo 1
    fi
}
## @function: 判断$1是否以$2结尾
## @return:   结果以echo方式返回
function strendwith()
{
    if [[ "${1%$2}" = "$1" ]]; then
        echo 0
    else 
        echo 1
    fi
}
## @function: .
## @note: 按空格分隔没有意义, 需要指定显式字符.
function strsplit()
{

}

function strreplace()
{

}

## @function: 判断字符串$1与$2是否相等
## @return:   结果以echo形式返回
function strequal()
{
    if [[ $1 == $2 ]]; then
        echo 1
    else
        echo 0
    fi
}

function strupper()
{
    echo ${1^^}
}

function strlower()
{
    echo ${1,,}
}
