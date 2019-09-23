# bash编程规范

## 关于注释

短注释仍然使用`#`, 跨行注释可以借助冒号`:`与引号`'`完成.

```bash
: '
## 注意冒号后有一个空格
## crontab设置
* * * * * source /root/.ssh/ssh_tunnel_keepalive.sh && check_ssh_proc
*/2 * * * * source /root/.ssh/ssh_tunnel_keepalive.sh && check_ssh_tunnel
'
var=123
```
