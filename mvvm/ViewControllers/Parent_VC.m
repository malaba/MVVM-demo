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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewmodel = [Parent_VM new];
    
    Parent_VC __weak *wself = self;
    
    [self.viewmodel.unloggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.loginIndicator.backgroundColor = [UIColor redColor];
        
    }];
    
    [self.viewmodel.loggedState setDidEnterStateBlock:^(TKState *state, TKTransition *transition) {
        wself.loginIndicator.backgroundColor = [UIColor greenColor];
    }];
    
    
}

- (IBAction)logMe:(id)sender {
    [self.viewmodel.statemachine fireEvent:self.viewmodel.loginTransition userInfo:nil error:nil];
}

@end
