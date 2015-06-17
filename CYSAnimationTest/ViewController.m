//
//  ViewController.m
//  CYSAnimationTest
//
//  Created by YanceyChan on 15/6/11.
//  Copyright (c) 2015年 Yancey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView1;
@property (weak, nonatomic) IBOutlet UIView *myView2;
@property (weak, nonatomic) IBOutlet UIView *myView3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myView1Direction;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myView3Direction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView2.alpha  = 0;
    self.myView3.alpha = 0;
    
    //这个函数是动画的最终位置确定之后，做出animations里面的效果，但最后view的位置都会回到设定好的位置
    //duration:动画持续时间
    //delay:延迟时间
    //usingSpringWithDamping: 0。1-1 0.1弹性大 1没弹性 弹的次数和激烈程度
    //initialSpringVelcity:初始速度，越大，位移越多
    //options:重复等选项
    [UIView animateWithDuration:5 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:4 options:UIViewAnimationOptionRepeat animations:^{
        CGPoint center1 = self.myView1.center;
        center1.y += 300;
        self.myView1.center = center1;
        self.myView1.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:5 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionRepeat animations:^{
        self.myView2.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:5 delay:2 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:UIViewAnimationOptionRepeat animations:^{
        self.myView3.alpha = 1;
        CGPoint center3 = self.myView3.center;
        center3.y -= 300;
        self.myView3.center = center3;
    } completion:^(BOOL finished) {
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
