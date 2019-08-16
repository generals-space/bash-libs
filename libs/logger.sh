#!/bin/bash

__LOGGER_LEVEL_DEBUG__=1
__LOGGER_LEVEL_INFO__=2
__LOGGER_LEVEL_WARN__=3
__LOGGER_LEVEL_ERROR__=4

__LOGGER_LOG_LEVEL__=$__LOGGER_LEVEL_INFO__

function _get_now()
{
    echo -n $(date +'[%Y/%m/%d %H:%M:%S]')
}

##########################################################
## 日志打印函数, 按等级输出

## 知识点
## 双小括号内可以使用> >=, ==, <=, <等高级语言的逻辑运算符
## 且双小括号内引用变量不必加$前缀
## 为了使用输出信息左侧对齐, DEBUG, INFO等冒号之间与$1参数的空格是不同的.

##########################################################
## 颜色打印只适合在终端输出, 如果输出到文件会乱码, 所以log_XXX用于写入日志文件.
function log_debug()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_DEBUG__ )); then
        echo "$(_get_now) DEBUG:   $1"
    fi
}
function log_info()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_INFO__ )); then
        echo "$(_get_now) INFO:    $1"
    fi
}
function log_warn()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_WARN__ )); then
        echo "$(_get_now) WARN:    $1"
    fi
}
function log_error()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_ERROR__ )); then
        echo "$(_get_now) ERROR:   $1"
    fi
}
## log_success不判断等级, 只是一个工具函数, 因为ta打印的是绿色字符.
function log_success()
{
        echo "$(_get_now) SUCCESS: $1"
}
##########################################################
## 颜色打印日志
## echo -e不转义反斜线, 因为要输出颜色信息
## 注意$1使用双引号包裹, 这是因为如果传入的参数包含空格时不会分隔.
function clog_debug()
{
    echo -e "\033[34m$(log_debug "$1")\033[0m"
}
function clog_info()
{
    echo -e "$(log_info "$1") \033[0m"
}
function clog_warn()
{
    echo -e "\033[33m$(log_warn "$1")\033[0m"
}
function clog_error()
{
    echo -e "\033[31m$(log_error "$1")\033[0m"
}

function clog_success()
{
    echo -e "\033[32m$(log_success "$1")\033[0m"
}

##########################################################
## 彩色打印函数, 与日志等级无关, 只作为工具函数
function print()
{
    echo -e "$1 "
}
function print_blue()
{
    echo -e "\033[34m$1 \033[0m"
}
function print_green()
{
    echo -e "\033[32m$1 \033[0m"
}
function print_yellow()
{
    echo -e "\033[33m$1 \033[0m"
}
function print_red()
{
    echo -e "\033[31m$1 \033[0m"
}
