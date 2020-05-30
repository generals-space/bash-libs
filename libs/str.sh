#!/bin/bash

## @function: 计算指定字符串的长度
## $1:        目标字符串
function strlen() 
{
    ## 1. wc 的-L选项, 直接获取当前行的字符数
    ## wc的选项可能由于不同系统平台而不同, 所以尽量不考虑这种方式.
    ## echo $1 | wc -L
    ## 2. ${}方法, 把字符串变量当作是数组处理
    echo ${#1}
    ## 3. awk内置的length()函数
    ## echo $1 | awk '{print length($0)}'
    ## 4. expr内置lenght无法处理变量中存在空格的情形, 放弃使用
}

## @function: 移除参数$1左右两侧的空白字符
function strtrim()
{
:
}
function strltrim()
{
:
}
function strrtrim()
{
:
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
:
}

## @function 将目标字符串$1中指定内容a替换内容b.
## $1:        目标字符串
## $2:        待被替换的内容a
## $3:        用于替换的内容b
## $4:        是否全局替换, 如果不是, 则只替换$1中第一个$2. 
##            如果需填true(其余参数无效), 默认为否.
## @return:   结果以echo方式返回
function strreplace()
{
    if [[ "$4" = "true" ]]; then
        echo ${1//$2/$3}
    else 
        echo ${1/$2/$3}
    fi
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

## @note: MacOS下的bash可能会出错: bad substitution
function strupper()
{
    echo ${1^^}
}

## @note: MacOS下的bash可能会出错: bad substitution
function strlower()
{
    echo ${1,,}
}

## @function: 字符串切片, 不支持倒数截取
## $1:        待截取的字符串
## $2:        开始位置start(可为负数, 倒数计数)
## $3:        结束位置end(可为负数, 倒数计数). 
##            由于是左闭右开区间, 所以$3最大可以为$1的长度值本身.
##            可为空, 为空时表示截取到$1结尾.
function strslice()
{
    local slen=$(strlen "$1")
    local start=$2 
    local end=${3:-$slen}
    ## 如果结束位置超出了$1的长度, 则抛出异常
    if ((end > slen)); then
        ## 抛出异常, 同时返回空字符串
        echo 'invalid end param' 1>&2
        return 1
    fi

    if ((start < 0)); then
        ## let 简单计算命令
        let start=$slen+$start
    fi
    if ((end < 0)); then
        ## let 简单计算命令
        let end=$slen+$end
    fi
    ## 如果起始位置>结束位置, 则抛出异常
    if ((start > end)); then
        ## 抛出异常
        return 1
    fi
    local len=$end-$start
    echo ${1:start:len}
}

## @function: 字符串切片, 不支持倒数截取
## $1:        待截取的字符串
## $2:        从开始计数截取的位置start
## $3:        截取的长度len(len可以超过str的长度)
function strsub()
{
    ## 第一个参数为变量时不可以带$符号, 
    ## 第2,3个参数必须带, 否则会被当成数值
    if [[ $3 != '' ]]; then
        echo ${1:$2:$3}
    else
        echo ${1:$2}
    fi
}

## @function: 字符串反向切片(string reverse sub), 倒数截取
## $1:        待截取的字符串
## $2:        从末尾计数截取的位置start
## $3:        截取的长度len(len可以超过str的长度)
function strrsub()
{
    ## 第一个参数为变量时不可以带$符号, 
    ## 第2,3个参数必须带, 否则会被当成数值
    if [[ $3 != '' ]]; then
        echo ${1:0-$2:$3}
    else
        echo ${1:0-$2}
    fi
}
