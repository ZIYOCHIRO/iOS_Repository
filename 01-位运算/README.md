## 位运算 - `&`、`|`、`~`操作

> &：按位与，当两个数都为1时，结果为1，其他情况都为0
* 用于**读取**某位是0还是1

 如果想知道OriginNumber第二位上的数字是0还是1，就用MaskNumber和它进行&操作，MaskNumber除了第二位是1，其他位上都是0：

 ```
   0b0000 1111   <- OriginNumber
 & 0b0000 0010   <- MaskNumber
 -------------
   0b0000 0010   <- 读取到OriginNumber第二位上 值为 1


   0b0000 1101   <- OriginNumber
 & 0b0000 0010   <- MaskNumber
 -------------
   0b0000 0000   <- 读取到OriginNumber第二位上 值为 0
```


> ｜：按位或，当两个数都为0时，结果为0， 其他情况都为1
* 用于**设值**某位为1

如果想将OriginNumber第二位上的值设置为1，就用MaskNumber和它进行｜操作，MaskNumber除了第二位是1，其他位上都是0：

 ```
    0b0000 1101   <- OriginNumber
  | 0b0000 0010   <- MaskNumber
 -------------
    0b0000 1111   <- OriginNumber第二位上本来是0，现值为 1


   0b0000 1111   <- OriginNumber
 | 0b0000 0010   <- MaskNumber
 -------------
   0b0000 1111   <- OriginNumber第二位上本来是1 ，现值为 1

```

> ~：按位取反，所有位上，0变成1， 1变成0
* 用于**设值**某位为0
如果想将OriginNumber第二位上值设置为0，先将MaskNumber取反，再用OriginNumber与取反之后的MaskNumber进行&操作。
```
 ~ 0b0000 0010   <- MaskNumber
 -------------
   0b1111 1101   <- 对MaskNumber取反


   0b0000 1111   <- OriginNumber
 & 0b1111 1101   <- MaskNumber 取反之后的值
 -------------
   0b0000 1101   <- OriginNumber第二位上本来是1 ，现值为 0

   0b0000 1101   <- OriginNumber
 & 0b1111 1101   <- MaskNumber 取反之后的值
 -------------
   0b0000 1101   <- OriginNumber第二位上本来是0 ，现值为 0

```
