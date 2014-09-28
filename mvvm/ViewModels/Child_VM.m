//
//  Child_VM.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Child_VM+private.h"


@implementation Child_VM

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.statemachine = [TKStateMachine new];

  // States
    self.onState = [TKState stateWithName:@"ON"];
    self.offState = [TKState stateWithName:@"OFF"];
    [self.statemachine addStates:@[self.onState, self.offState]];
    
    self.statemachine.initialState = self.offState;

    
  // Transitions
    self.powerOnTransition = [TKEvent eventWithName:@"powerOnTransition" transitioningFromStates:@[self.offState] toState:self.onState];
    self.powerOffTransition = [TKEvent eventWithName:@"powerOffTransition" transitioningFromStates:@[self.onState] toState:self.offState];
    [self.statemachine addEvents:@[self.powerOnTransition, self.powerOffTransition]];

    [self.statemachine activate];
}

@end
