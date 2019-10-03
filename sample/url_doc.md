# url_doc

参考文章

1. [shell 下 urlencode/urldecode 编码/解码的几种方法](https://blog.csdn.net/carlostyq/article/details/7928610)
    - 关于urlencode/urldecode必要性的解释很准确
    - 借助`xxd`和`od`命令实现shell版本的encode/decode方法.
2. [github gist urlencode/urldecode](https://gist.github.com/cdown/1163649)

我们在浏览器中访问一个路径中包含中文字符的url时, 从地址栏复制出地址会发现其中的中文字符是被转义过的. 如果使用`curl`直接访问包含中文(不只是中文, 还有其它的一些特殊字符等)的url可能会出错, 我们需要一事先将url进行编码.

js, python等高级语言都有对应的urlencode/urldecode函数, 用于转义url中的非法字符.

```js
encodeURI('good 中国!') // "good%20%E4%B8%AD%E5%9B%BD!"
```

```py
from urllib.parse import quote
quote('good 中国!') ## 'good%20%E4%B8%AD%E5%9B%BD%21'
```

> js与py的encode函数有些许差别, js的3个编码函数`escape`, `encodeURI`和`encodeURIComponent`没有一个是与python中`quote`一致的.

而shell中是没有提供类似的命令, 但是

参考文章1中的方案是直接借助`xxd`或`od`命令模拟`encode`/`decode`, 但是这样做的缺陷是, ta们只是单纯的进行进制转换(转换成16进制), 无法分辨哪些是需要转换的, 哪些是不需要的(比如26个英文字母在url中就是合法字符).

```bash
echo -n 'good 中国' | xxd -plain | sed 's/\(..\)/%\1/g' ## %67%6f%6f%64%20%e4%b8%ad%e5%9b%bd%21
```

> `sed`的部分是将每2个16进制字符(0-F)前添加上百分号`%`, 如`中`的16进制表示`e4b8ad`->`%e4%b8%ad`.

这样是不行的.

参考文章2中给出了`encode`更为细致的实现方法, 即循环转义每个字符为16进制. 但由于ta借助的是`printf`命令, 只能转换单个char字符为16进制, 但是中文字符是由多个char字符组合而成的, 这样转换出来的字符是有问题的, 所以仍然需要`xxd`的帮助.

------

另外, 貌似不同语言对于url中哪些字符需要编码的表现并不相同, 这里我们只暂时这么用吧, 以后再更新.
