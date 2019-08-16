#!/bin/bash

## @function: 返回当前时间的时间戳.
## @note:     注意位数, 与python相同, 但比js少3位
## @return:   结果以echo方式返回.
function now()
{
    echo -n $(date +'%s')
}

function get_std_date()
{
    echo -n $(date +'%Y/%m/%d %H:%M:%S')
}
