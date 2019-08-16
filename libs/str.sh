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
