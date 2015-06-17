//
//  ViewController2.m
//  CYSAnimationTest
//
//  Created by YanceyChan on 15/6/11.
//  Copyright (c) 2015年 Yancey. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (strong, nonatomic) UIImageView *status;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSArray *messages;
@property (assign, nonatomic) CGPoint statusPosition;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.status = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    self.label = [[UILabel alloc]init];
    self.messages = @[@"Connecting...", @"Authorizing ...", @"Sending credentials ...", @"Failed"];
    self.statusPosition = CGPointZero;
    self.status.hidden = YES;
    self.status.center = CGPointMake(160, 300);
    [self.view addSubview:self.status];
    
    self.label.frame = CGRectMake(0, 0, self.status.frame.size.width, self.status.frame.size.height);
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    self.label.textColor = [UIColor colorWithRed:0.89 green:0.38 blue:0.0 alpha:1.0];
    self.label.textAlignment = UITextAlignmentCenter;
    [self.status addSubview:self.label];
    
    self.statusPosition = self.status.center;
    
    [self delay:1 completion:^{
        [self showMessage:0];
    }];
    
    // Do any additional setup after loading the view.
}

//uiview 进场，离场效果

- (void)showMessage:(int)index{
    int tempIndex = index%4;
    self.label.text = self.messages[tempIndex];
    
    [UIView transitionWithView:self.status duration:0.33 options:UIViewAnimationOptionTransitionCurlDown | UIViewAnimationOptionCurveEaseOut animations:^{
        self.status.hidden = NO;
    } completion:^(BOOL finished) {
        [self delay:2.0 completion:^{
            
                [self removeMessage:tempIndex];
            
        }];
    }];
}

- (void)removeMessage:(int)index{
    [UIView animateWithDuration:0.33 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
//        self.status.center.x += self.view.frame.size.width;
        CGPoint tempPoint = self.status.center;
        tempPoint.x += self.view.frame.size.width;
        self.status.center = tempPoint;
    } completion:^(BOOL finished) {
        self.status.hidden = YES;
        self.status.center = self.statusPosition;
        [self showMessage:(index + 1)];
    }];
}

- (void)delay:(double)seconds completion:(void(^)())completion {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * seconds);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        completion();
    });
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
