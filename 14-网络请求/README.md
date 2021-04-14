使用：
1.import 头文件
```
#import "SRNetworkTool.h"
```
2.调用POST方法
```
[SRNetworkTool PostRequestWithURL:@"" InfoDic:@{} successBlock:^(id  _Nonnull obj) {
    //
} failBlock:^{
    //
}];
```

3.调用GET方法
```
[SRNetworkTool GetRequestWithURL:@"" InfoDic:@{} successBlock:^(id  _Nonnull obj) {
    //
} failBlock:^{
    //
}];
```
