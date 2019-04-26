
## 说明
实际效果如下图：

![](https://github.com/mythkiven/JCombineLoadingAnimation/blob/master/gif.gif)


**JCombineLoadingAnimation 是一个组合的动画效果，其中的各部分都可以单独拿出来使用**

### 1、外层旋转动画

有两种，参见gif的演示，可以使用绚丽的动画，或者简单的颜色渐变，参见gif演示。
1、颜色渐变的动画:基于Core Graphics和CAAnimation,在类：JDradualLoadingView中，使用CGContextRef和CABasicAnimation来实现的。动画的相关控制我已经封装到一个方法里面，具体可以看代码。
2、绚丽的效果，旋转的控制使用刷新频率精度较高的CADisplayLink。颜色的渐变使用代码写起来比较麻烦，我直接贴了张图片上去。可以按照需求更图片即可。

针对外层动画的控制，我进行了简单的划分：
```
typedef NS_ENUM(NSInteger, JLoadingManagerType) {
    JLoadingManagerTypeImage = 10,
    JLoadingManagerTypeColor,
    JLoadingManagerTypeOther,
};
```

### 2、内层的文字和转动的圆

因为要控制动画的启动、暂停，以及实际的加载速度，所以我也是基于Core Graphics使用CGContextRef来操作的。在类：JControlLoadingCircleLayer中实现，因为是直接在layer中绘制，所以会有严重的锯齿现象。可以通过 

     self.layer.contentsScale=[[UIScreen mainScreen] scale];
来解决在layer上绘制的锯齿现象。


### 3、下方不断加载的cell
这个就是利用tableview的一个方法实现的:

    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];


其实这份代码写的蛮早了，这几天拿出来调试了下就传上来了，里面代码写的挺糟的也没来得及改，如果有BUG还请提出来，我会优化的。



