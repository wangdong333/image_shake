//
//  ViewController.m
//  图像抖动
//
//  Created by long on 13-5-28.
//  Copyright (c) 2013年 long. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 150, 200, 200)];
    [self.imageView setImage:[UIImage imageNamed:@"手机.jpg"]];
    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnImageView:)];
    
    [self.imageView addGestureRecognizer:singleTap];
    
    [self.view addSubview:self.imageView];
    
}
-(void)btnImageView:(id)sender {
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //设置抖动幅度
    shake.fromValue = [NSNumber numberWithFloat:-0.1];
    
    shake.toValue = [NSNumber numberWithFloat:+0.1];
    
    shake.duration = 0.1;
    
    shake.autoreverses = YES; //是否重复
    
    shake.repeatCount = 4;
    
    [self.imageView.layer addAnimation:shake forKey:@"imageView"];
    
    self.imageView.alpha = 1.0;
    
    [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:nil completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
