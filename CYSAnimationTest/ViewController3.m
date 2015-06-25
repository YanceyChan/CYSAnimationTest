//
//  ViewController3.m
//  CYSAnimationTest
//
//  Created by YanceyChan on 15/6/16.
//  Copyright (c) 2015年 Yancey. All rights reserved.
//

#import "ViewController3.h"
#import <QuartzCore/QuartzCore.h>

typedef enum : int{
    Positive = 1,
    Negative = -1,
    
}AnimationDirection;

@interface ViewController3 ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    [self repeat1];
    // Do any additional setup after loading the view.
}

- (void)repeat1{
    [self delay:1 completion:^{
        [self cubeTransition:self.myLabel text:@"Sunny" direction:Positive];
        [self fadeImageView:self.myImageView toImage:[UIImage imageNamed:@"bg-sunny"]];
        [self repeat2];
    }];
}

- (void)repeat2{
    [self delay:1 completion:^{
        [self fadeImageView:self.myImageView toImage:[UIImage imageNamed:@"bg-snowy"]];
        [self cubeTransition:self.myLabel text:@"Snowy" direction:Negative];
        [self repeat1];
    }];
}

- (void)fadeImageView:(UIImageView *)imageView toImage:(UIImage *)toImage{
    [UIView transitionWithView:imageView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imageView.image = toImage;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)cubeTransition:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction{
    UILabel *auxLabel = [[UILabel alloc]initWithFrame:label.frame];
    auxLabel.text = text;
    auxLabel.font = label.font;
    auxLabel.textAlignment = label.textAlignment;
    auxLabel.textColor = label.textColor;
    
    CGFloat auxLabelOffset = direction * label.frame.size.height/2;
    auxLabel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 0.1), CGAffineTransformMakeTranslation(0.0, auxLabelOffset));
    
    [label.superview addSubview:auxLabel];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        auxLabel.transform = CGAffineTransformIdentity;
        label.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 0.1), CGAffineTransformMakeTranslation(0.0, -auxLabelOffset));
    } completion:^(BOOL finished) {
        label.text = auxLabel.text;
        label.transform = CGAffineTransformIdentity;
        [auxLabel removeFromSuperview];
        
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
