//
//  ShapeView.h
//  SouFun
//
//  Created by 张仙东 on 15/8/5.
//
//

#import <UIKit/UIKit.h>

@interface ShapeView : UIView
/** 画线*/
+(instancetype)drawALineWithRect:(CGRect)rect
                       backColor:(UIColor *)color
                       superView:(UIView *)superview
                     borderWidth:(CGFloat)borderwidth
                     borderColor:(UIColor *)bordercolor;
/** 画圆*/
+(instancetype)drawACircleWithbackColor:(UIColor *)color
                                 center:(CGPoint)center
                           cornerRadius:(CGFloat )radius
                              superView:(UIView *)superview
                            borderWidth:(CGFloat)borderwidth
                            borderColor:(UIColor *)bordercolor;
/** 画椭圆*/
+(instancetype)drawAOvalWithrect:(CGRect)rect
                       backColor:(UIColor *)color
                       superView:(UIView *)superview
                     borderWidth:(CGFloat)borderwidth
                     borderColor:(UIColor *)bordercolor;
/** 画自定义图行*/
+(instancetype)drawACustomShapeWithrect:(CGRect)rect
                              superView:(UIView *)superview
                            borderColor:(UIColor *)bordercolor
                              fillColor:(UIColor *)fillcolor
                              backColor:(UIColor *)backColor
                          BeziatherPath:path;
@end
