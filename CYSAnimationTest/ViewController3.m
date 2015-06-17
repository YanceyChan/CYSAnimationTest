//
//  ViewController3.m
//  CYSAnimationTest
//
//  Created by YanceyChan on 15/6/16.
//  Copyright (c) 2015年 Yancey. All rights reserved.
//

#import "ViewController3.h"
enum AnimationDirection{
    Positive = 1,
    Negative = -1
};
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
        
    }];
}

- (void)repeat2{
    
}

//- (void)cubeTransition:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction{
//    
//}

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
