# UIButton-JLModelButton
一个 UIButton 的分类，使用 Runtime 动态绑定使它能够持有 model 属性（id 类型），便于直接在点击事件中抓取数据。

这是在一个项目需求中想到的，用于减少获取 Button 对应的 model 产生错误，同时减少可能出现的遍历以提升效率。

例如：
页面中有一组 Button ，可以将他们对应的 model 直接赋值给 UIButton 对象，等我们需要获取的时候，可以直接在 Button 的点击事件当中获取到其对应 model 。

### 1.创建 Button 时将 Model 赋值给它


    JLButtonModel *model = self.dataArr[i];
    UIButton *btn = [[UIButton alloc] init];
    btn.model = model;
    [btn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
### 2.在 Button 的点击事件当中直接通过属性取值


    - (void)didTouchBtn:(UIButton*)sender{
    
      JLButtonModel *model = (JLButtonModel*)sender.model;

    }



欢迎关注我的微信公众号“iOS精讲精练”，会不定时更新iOS相关技术文章。

![iOS技术公众号320.jpeg](https://upload-images.jianshu.io/upload_images/2618922-a74e7aaf6cc92df5.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


