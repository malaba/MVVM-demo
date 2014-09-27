//
//  Parent_VC.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VC.h"
#import "Parent_VC+private.h"

#import "Parent_VM.h"


@implementation Parent_VC

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupStatemachine];
}

#pragma mark - Statemachine
- (void)setupStatemachine {
    self.viewmodel = [Parent_VM new];
    
    Parent_VC __weak *wself = self;
    
    [self.viewmodel.unloggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.loginIndicator.backgroundColor = [UIColor redColor];
        
        wself.logmeButton.enabled = YES;
        wself.logoutButton.enabled = NO;
    }];
    
    [self.viewmodel.loggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.loginIndicator.backgroundColor = [UIColor greenColor];
        
        wself.logmeButton.enabled = NO;
        wself.logoutButton.enabled = YES;
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
