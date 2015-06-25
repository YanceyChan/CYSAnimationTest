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
    [self planeDepart];
    // Do any additional setup after loading the view.
}

- (void)planeDepart{
    CGPoint originalCenter = self.myPlaneView.center;
    [UIView animateKeyframesWithDuration:1.5 delay:0.0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
            CGPoint center = self.myPlaneView.center;
            center.x += 80.0;
            center.y += 10.0;
            self.myPlaneView.center = center;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:0.4 animations:^{
            self.myPlaneView.transform = CGAffineTransformMakeRotation(-M_PI_4/2);
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
