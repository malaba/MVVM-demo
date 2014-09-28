//
//  Parent_VM.m
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VM+private.h"


@implementation Parent_VM

- (void)setupStateMachine:(void (^)(TKStateMachine *))block {
    self.statemachine = [TKStateMachine new];

  // States
    self.unloggedState = [TKState stateWithName:@"unlogged"];
    self.loggedState = [TKState stateWithName:@"logged"];
    [self.statemachine addStates:@[self.unloggedState, self.loggedState]];
   
  // Transitions
    self.loginTransition = [TKEvent eventWithName:@"loginTransition" transitioningFromStates:@[self.unloggedState] toState:self.loggedState];
    self.logoutTransition = [TKEvent eventWithName:@"logoutTransition" transitioningFromStates:@[self.loggedState] toState:self.unloggedState];
    [self.statemachine addEvents:@[self.loginTransition, self.logoutTransition]];

  // Specific Behaviors
    block(self.statemachine);

  // Go
    self.statemachine.initialState = self.unloggedState;
    [self.statemachine activate];
}

@end
