#!/bin/bash

__LOGGER_LEVEL_DEBUG__=1
__LOGGER_LEVEL_INFO__=2
__LOGGER_LEVEL_WARN__=3
__LOGGER_LEVEL_ERROR__=4

__LOGGER_LOG_LEVEL__=$__LOGGER_LEVEL_INFO__

##########################################################
## 日志打印函数, 按等级输出

## 知识点
## 双小括号内可以使用> >=, ==, <=, <等高级语言的逻辑运算符
## 且双小括号内引用变量不必加$前缀
## echo -e不转义反斜线, 因为要输出颜色信息
## 为了使用输出信息左侧对齐, DEBUG, INFO等冒号之间与$1参数的空格是不同的.
function log_debug()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_DEBUG__ )); then
        echo -e "\033[34mDEBUG:   $1 \033[0m"
    fi
}
function log_info()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_INFO__ )); then
        echo -e "INFO:    $1"
    fi
}
function log_warn()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_WARN__ )); then
        echo -e "\033[33mWARN:    $1 \033[0m"
    fi
}
function log_error()
{
    if (( __LOGGER_LOG_LEVEL__ <= __LOGGER_LEVEL_ERROR__ )); then
        echo -e "\033[31mERROR:   $1 \033[0m"
    fi
}

## log_success不判断等级, 只是一个工具函数, 因为ta打印的是绿色字符.
function log_success()
{
    echo -e "\033[32mSUCCESS: $1 \033[0m"
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
