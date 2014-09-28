//
//  Parent_VM.h
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <TransitionKit.h>


@interface Parent_VM : NSObject

@property (strong, nonatomic) TKStateMachine *statemachine;

@property (strong, nonatomic) TKState *unloggedState;
@property (strong, nonatomic) TKState *loggedState;

@property (strong, nonatomic) TKEvent *loginTransition;
@property (strong, nonatomic) TKEvent *logoutTransition;

- (void)setupStateMachine:(void (^)(TKStateMachine *statemachine))block;

@end
