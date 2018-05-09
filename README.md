# RandomCornerDemo
## 给视图指定角添加圆角    
测试不同布局（绝对布局、相对布局）情况下使用UIBezierPath类的bezierPathWithRoundedRect:byRoundingCorners:cornerRadii方法给视图指定角添加圆角的效果：  
**设置原则**--不管什么布局方式，必须在能拿到View的frame（bounds）大小的时候设置才有用，如果在frame还没有的情况下设置，视图展示出来是看不到的  
### ViewController中：
1.绝对布局：设置完frame后就可以设置视图的圆角
2.相对布局：添加到VC的主视图self.view中的子视图设置圆角的地方：viewDidLayoutSubviews/viewDidAppear方法中，此时视图布局已经完成，视图的frame已经有值，可以正常设置圆角

### 自定义视图中
1.设置圆角的代码封装到自定义视图类中：应该在视图的drawRect方法或layoutSubviews方法中给视图自己设置圆角（initWithFrame方法中不一定传入frame，所以不能在这个方法中设置）（layoutSublayersOfLayer方法中也可以，但是这里会多次调用，有点多余）  
2.自定义视图中的子视图设置圆角  
* 绝对布局：如果子视图是绝对布局，则设置frame之后就可以给子视图设置圆角，也可以  
* 相对布局：自定义视图的drawRect方法或layoutSubviews方法中设置，这些地方设置了相对布局的子视图的frame也已经初始化完毕，可以设置圆角。（layoutSublayersOfLayer方法中也可以，但是这里会多次调用，有点多余）

> 详细代码参考代码，可以自己运行测试
