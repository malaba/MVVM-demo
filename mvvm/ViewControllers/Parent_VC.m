//
//  Parent_VC.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VC+private.h"

#import "Child_VC.h"
#import "Parent_VM.h"


@implementation Parent_VC

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.childA = [Child_VC new];
    self.childA.view.frame = CGRectMake(20, 200, 100, 100);
    
    self.childB = [Child_VC new];
    self.childB.view.frame = CGRectMake(150, 200, 100, 100);
    
    [self setupStatemachine];
}

#pragma mark - Statemachine
- (void)setupStatemachine {
    self.viewmodel = [Parent_VM new];
    
    Parent_VC __weak *wself = self;
    
    [self.viewmodel.unloggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             wself.loginIndicator.backgroundColor = [UIColor redColor];
                         }];
        
        wself.logmeButton.enabled = YES;
        wself.logoutButton.enabled = NO;
        
        [wself removeChildVC:wself.childA];
        [wself removeChildVC:wself.childB];
    }];
    
    [self.viewmodel.loggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             wself.loginIndicator.backgroundColor = [UIColor greenColor];
                         }];

        wself.logmeButton.enabled = NO;
        wself.logoutButton.enabled = YES;
        
        [wself addChildVC:wself.childA];
        [wself addChildVC:wself.childB];
    }];
}

#pragma mark - Utils
- (void)addChildVC:(UIViewController *)vc {
    vc.view.userInteractionEnabled = YES;
    
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
    [UIView animateWithDuration:1.0 animations:^{
        vc.view.alpha = 1.0f;
    }];
}

- (void)removeChildVC:(UIViewController *)vc {
    vc.view.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         vc.view.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [vc willMoveToParentViewController:nil];
                         [vc.view removeFromSuperview];
                         [vc removeFromParentViewController];
                     }];
}

#pragma mark - Actions
- (IBAction)logMe:(id)sender {
    [self.viewmodel.statemachine fireEvent:self.viewmodel.loginTransition userInfo:nil error:nil];
}

- (IBAction)logout:(id)sender {
    [self.viewmodel.statemachine fireEvent:self.viewmodel.logoutTransition userInfo:nil error:nil];
}

@end
