//
//  Parent_VC.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VC.h"
#import "Parent_VC+private.h"

#import "Child_VC.h"
#import "Parent_VM.h"


@implementation Parent_VC

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupStatemachine];
    
    self.child = [Child_VC new];
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
        
        [wself removeChild];
    }];
    
    [self.viewmodel.loggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             wself.loginIndicator.backgroundColor = [UIColor greenColor];
                         }];

        wself.logmeButton.enabled = NO;
        wself.logoutButton.enabled = YES;
        
        [wself addChild];
    }];
}

#pragma mark - Utils
- (void)addChild {
    [self addChildViewController:self.child];
    self.child.view.frame = CGRectMake(20, 200, 100, 100);
    [self.view addSubview:self.child.view];
    [self.child didMoveToParentViewController:self];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.child.view.alpha = 1.0f;
    }];
}

- (void)removeChild {
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.child.view.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [self.child willMoveToParentViewController:nil];
                         [self.child.view removeFromSuperview];
                         [self.child removeFromParentViewController];
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
