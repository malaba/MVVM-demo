//
//  Child_VC.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Child_VC+pivate.h"

#import "Child_VM.h"


@implementation Child_VC

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupStatemachine];
}

#pragma mark - Statemachine
- (void)setupStatemachine {
    self.viewmodel = [Child_VM new];
    
    Child_VC __weak *wself = self;
    
    [self.viewmodel.offState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.view.backgroundColor = [UIColor redColor];
    }];
    
    [self.viewmodel.onState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.view.backgroundColor = [UIColor greenColor];
    }];
}

#pragma mark - Actions
- (IBAction)flip:(id)sender {
    if (self.viewmodel.statemachine.currentState == self.viewmodel.offState) {
        [self.viewmodel.statemachine fireEvent:self.viewmodel.powerOnTransition userInfo:nil error:nil];
    }
    else {
        [self.viewmodel.statemachine fireEvent:self.viewmodel.powerOffTransition userInfo:nil error:nil];
    }
}

@end
