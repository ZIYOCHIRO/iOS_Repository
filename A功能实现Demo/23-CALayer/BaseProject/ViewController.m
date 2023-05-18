//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#import "SRLayer.h"

@interface ViewController ()<CALayerDelegate> {
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *button_1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button_1.backgroundColor = [UIColor purpleColor];
    [button_1 setTitle:@"Action_1" forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(action_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    UIButton *button_2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    button_2.backgroundColor = [UIColor purpleColor];
    [button_2 setTitle:@"Action_2" forState:UIControlStateNormal];
    [button_2 addTarget:self action:@selector(action_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
    
    UIButton *button_3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    button_3.backgroundColor = [UIColor purpleColor];
    [button_3 setTitle:@"Action_3" forState:UIControlStateNormal];
    [button_3 addTarget:self action:@selector(action_3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_3];
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"Action_4" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(action_4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
    
}

- (void)action_1 {
    //MARK: 自定义layer1
    SRLayer *layer = [SRLayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    [layer setNeedsDisplay];//需要调用setNeedsDisplay这个方法，才会触发drawInContext:方法的调用，然后进行绘图
    [self.view.layer addSublayer:layer];
}

- (void)action_2 {
    //MARK: 自定义layer2
    CALayer *layer = [CALayer layer];
    layer.delegate = self;
    layer.bounds = CGRectMake(0,0, 100, 100);
    layer.position = CGPointMake(100, 100);
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}


- (void)action_3 {
   
}

- (void)action_4 {

}

#pragma mark -
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextSetLineWidth(ctx, 10);
    CGContextAddRect(ctx, layer.bounds);
//    CGContextMoveToPoint(ctx, 0, 0);
//    CGContextAddLineToPoint(ctx, 0, 100);
//    CGContextAddLineToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 100, 0);
//    CGContextClosePath(ctx);
    
    CGContextStrokePath(ctx);
}

@end

