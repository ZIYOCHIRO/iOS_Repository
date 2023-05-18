# 自动隐藏HomeIndicator

 设置HomeIndicator自动隐藏-适合非游戏App沉浸式体验（全屏录制/播放）

```
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}
```

# 延迟响应
 延迟系统级别的响应-适合游戏防止误触
 （底部的Home Indicator当很长一段时间不去触碰的时候由黑色/白色 变成非常透明的灰色）
* 1.第一次进行操作时会默认执行App内手势，同时激活Home Indicator
* 2.短时间内进行第二次操作就可以返回桌面
```
- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures {
    return UIRectEdgeAll;
}
```

## 需要注意的是：prefersHomeIndicatorAutoHidden和preferredScreenEdgesDeferringSystemGestures不可一起使用，如果一起使用的话后者是不生效的。

