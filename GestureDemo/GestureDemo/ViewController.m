//
//  ViewController.m
//  GestureDemo
//
//  Created by 小2 on 2019/2/20.
//  Copyright © 2019 小2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *moveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIScreenEdgePanGestureRecognizer *gesture = [UIScreenEdgePanGestureRecognizer new];
//    gesture.edges = UIRectEdgeLeft;
//    [gesture addTarget:self action:@selector(gestureMoved:)];
//    [self.view addGestureRecognizer:gesture];
    
    UIPanGestureRecognizer *pan = [UIPanGestureRecognizer new];
    [pan addTarget:self action:@selector(gestureMoved:)];
    [self.moveView addGestureRecognizer:pan];
    
    
    ui
    
}

- (void)gestureMoved:(UIScreenEdgePanGestureRecognizer *)gesture {
    
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 15, 15, 15);
    
    CGPoint point = [gesture translationInView:gesture.view];
    NSLog(@"%@",NSStringFromCGPoint([gesture translationInView:gesture.view]));
    gesture.view.transform = CGAffineTransformTranslate(gesture.view.transform, point.x, point.y);
    [gesture setTranslation:CGPointZero inView:gesture.view];
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat viewH = CGRectGetHeight(self.view.frame);
    
    
    CGFloat maxX = CGRectGetMaxX(gesture.view.frame);
    CGFloat maxY = CGRectGetMaxY(gesture.view.frame);
    
    CGFloat minX = CGRectGetMinX(gesture.view.frame);
    CGFloat minY = CGRectGetMinY(gesture.view.frame);
    
    CGFloat gestureViewW = gesture.view.frame.size.width;
    CGFloat gestureViewH = gesture.view.frame.size.height;
    
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        
        CGFloat x = gesture.view.frame.origin.x;
        CGFloat y = gesture.view.frame.origin.y;
        CGFloat width = gestureViewW;
        CGFloat height = gestureViewH;
        
        if (maxX > viewWidth - padding.right) {
            x = viewWidth - width - padding.right;
        }
        
        if (maxY > viewH - padding.bottom) {
            y = viewH - height - padding.bottom;
        }
        
        if (minX < 0 + padding.left) {
            x = 0 + padding.left;
        }
        
        if (minY < 0 + padding.top) {
            y = 0 + padding.top;
        }
        
        
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
             gesture.view.frame = CGRectMake(x, y, width, height);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
