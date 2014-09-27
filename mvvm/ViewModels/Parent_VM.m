//
//  Parent_VM.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VM.h"
#import "Parent_VM+private.h"


@implementation Parent_VM

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.statemachine = [TKStateMachine new];
    
    self.unlogged = [TKState stateWithName:@"unlogged"];
    self.logged = [TKState stateWithName:@"logged"];
    
    [self.statemachine addStates:@[self.unlogged, self.logged]];
    self.statemachine.initialState = self.unlogged;
    
    TKEvent *loginTransition = [TKEvent eventWithName:@"loginTransition" transitioningFromStates:@[ self.unlogged ] toState:self.logged];
    [self.statemachine addEvent:loginTransition];

    [self.statemachine activate];
}

@end
