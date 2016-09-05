//
//  ShapeView.m
//  SouFun
//  可以创建横线，圆形，正方形，椭圆形等。
//  Created by 张仙东 on 15/8/5.
//
//

#import "ShapeView.h"
@interface ShapeView()
@property (nonatomic,strong) UIBezierPath *path;//绘图时使用的对象
@property (nonatomic,assign) NSUInteger shape;//0.画线 1.画圆 2.画椭圆 3.自定义
@property (nonatomic,strong) UIColor *failColor;//填充颜色
@property (nonatomic,strong) UIColor *stockColor;//描边颜色
@end
@implementation ShapeView
#pragma mark- 1 shape ＝ 0 画线
+(instancetype)drawALineWithRect:(CGRect)rect
                       backColor:(UIColor *)color
                       superView:(UIView *)superview
                     borderWidth:(CGFloat)borderwidth
                     borderColor:(UIColor *)bordercolor
{
    ShapeView *view = [[ShapeView alloc]initWithFrame:rect];
    view.shape = 0;
   [view handleTheLineColorWithBackColor:color borderColor:bordercolor borderWidth:borderwidth];
    [superview   addSubview:view];
    return view;
    
}
-(void)handleTheLineColorWithBackColor:(UIColor *)color
                       borderColor:(UIColor *)borderColor
                       borderWidth:(CGFloat)borderwidth
{
    if (color==nil)
    {
        color = [UIColor blackColor];
    }
    if (borderColor ==nil)
    {
        borderColor = [UIColor clearColor];
    }
    self.backgroundColor = color;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderwidth;
    
}
#pragma mark- 2 shape ＝ 1 画圆
+(instancetype)drawACircleWithbackColor:(UIColor *)color
                                 center:(CGPoint)center
                           cornerRadius:(CGFloat )radius
                              superView:(UIView *)superview
                            borderWidth:(CGFloat)borderwidth
                            borderColor:(UIColor *)bordercolor
{
    CGRect frame = CGRectMake(center.x - radius, center.y - radius, 2*radius, 2*radius);
     ShapeView *view = [[ShapeView alloc]initWithFrame:frame];
    view.shape = 1;
    [view handleTheCircleColorWithBackColor:color borderColor:bordercolor borderWidth:borderwidth];
    [superview addSubview:view];
    return view;
}
-(void)handleTheCircleColorWithBackColor:(UIColor *)color
                           borderColor:(UIColor *)borderColor
                           borderWidth:(CGFloat)borderwidth
{
    if (color==nil)
    {
        color = [UIColor whiteColor];
    }
    if (borderColor ==nil)
    {
        borderColor = [UIColor clearColor];
    }
    self.layer.cornerRadius = self.frame.size.height / 2.0;
    self.layer.masksToBounds = YES;
    
    self.backgroundColor = color;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderwidth;
}
#pragma mark- 3 shape ＝ 2 画椭圆
+(instancetype)drawAOvalWithrect:(CGRect)rect
                       backColor:(UIColor *)color
                       superView:(UIView *)superview
                     borderWidth:(CGFloat)borderwidth
                     borderColor:(UIColor *)bordercolor
{
    ShapeView *view = [[ShapeView alloc]initWithFrame:rect];
    
    view.shape = 2;
    [view handleTheOvalColorWithBackColor:color borderColor:bordercolor borderWidth:borderwidth];
    [superview addSubview:view];
    return view;

}
-(void)handleTheOvalColorWithBackColor:(UIColor *)color
                             borderColor:(UIColor *)borderColor
                             borderWidth:(CGFloat)borderwidth
{
    if (color==nil)
    {
        color = [UIColor clearColor];
    }
    if (borderColor ==nil)
    {
        borderColor = [UIColor blackColor];
    }
    if (borderwidth <=0)
    {
        borderwidth = 1;
    }
    self.backgroundColor = [UIColor clearColor];
    
    CGRect rec = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.path = [UIBezierPath bezierPathWithOvalInRect:rec];
    self.path.lineWidth = borderwidth;
    self.failColor = color;
    self.stockColor = borderColor;
    [self setNeedsDisplay];
}

#pragma mark- 4 shape ＝ 3 自定义

+(instancetype)drawACustomShapeWithrect:(CGRect)rect
                              superView:(UIView *)superview
                            borderColor:(UIColor *)bordercolor
                              fillColor:(UIColor *)fillcolor
                              backColor:(UIColor *)backColor
                          BeziatherPath:path
{
    ShapeView *view = [[ShapeView alloc]initWithFrame:rect];
    view.shape = 3;
    view.backgroundColor = backColor;
    view.failColor = fillcolor;
    view.stockColor = bordercolor;
    view.path =  path;
    [view setNeedsDisplay];
    [view setNeedsLayout];
    [superview addSubview:view];
    return view;
    
}
#pragma mark- 绘图
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.path!=nil)
    {
        [self.stockColor setStroke];
        [self.failColor setFill];
        [self.path fill];
        [self.path stroke];
        
    }
    CGContextSaveGState(context);
}


@end
