Swift调用OC的方法比较简单
1. 在Bridge Header里 import OC的头文件， 然后就可以直接在Swift文件里调用了
2. 调用类方法  `SRMethod.sum(2, b: 3)`
3. 调用实例方法 
```
let method = SRMethod()
let sub = method.sub(3, b: 2)
```