//
//  ViewController4.m
//  CYSAnimationTest
//
//  Created by YanceyChan on 15/6/18.
//  Copyright (c) 2015年 Yancey. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()
@property (weak, nonatomic) IBOutlet UIImageView *myPlaneView;

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPlaneView.frame = CGRectMake(10, 300, self.myPlaneView.bounds.size.width, self.myPlaneView.bounds.size.height);
    [self planeDepart];
    // Do any additional setup after loading the view.
}

- (void)planeDepart{
    CGPoint originalCenter = self.myPlaneView.center;
    //需要注意的一点是addKeyframeWithRelativeStartTime中的startTime和relativeDuration都是相对与整个关键帧动画的持续时间（这里是4秒）的百分比，设置成0.5就代表4*0.5＝2（秒
    [UIView animateKeyframesWithDuration:4 delay:0.0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
            CGPoint center = originalCenter;
            center.x += 80.0;
            center.y -= 10.0;
            self.myPlaneView.center = center;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.4 animations:^{
            self.myPlaneView.transform = CGAffineTransformMakeRotation(-M_PI_4/2);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            CGPoint center = originalCenter;
            center.x += 160.0;
            center.y -= 50.0;
            self.myPlaneView.center = center;
            self.myPlaneView.alpha = 0.0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.51 relativeDuration:0.01 animations:^{
            self.myPlaneView.transform = CGAffineTransformIdentity;
            self.myPlaneView.center = CGPointMake(0.0, originalCenter.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.55 relativeDuration:0.45 animations:^{
            self.myPlaneView.alpha = 1.0;
            self.myPlaneView.center = originalCenter;
        }];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
