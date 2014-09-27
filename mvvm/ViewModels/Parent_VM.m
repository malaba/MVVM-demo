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
    
    self.unloggedState = [TKState stateWithName:@"unlogged"];
    self.loggedState = [TKState stateWithName:@"logged"];
    
    [self.statemachine addStates:@[self.unloggedState, self.loggedState]];
    self.statemachine.initialState = self.unloggedState;
    
    TKEvent *loginTransition = [TKEvent eventWithName:@"loginTransition" transitioningFromStates:@[ self.unloggedState ] toState:self.loggedState];
    [self.statemachine addEvent:loginTransition];

    [self.statemachine activate];
}

@end
