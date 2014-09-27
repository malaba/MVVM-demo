//
//  Child_VM.h
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <TransitionKit.h>


@interface Child_VM : NSObject

@property (strong, nonatomic) TKStateMachine *statemachine;

@property (strong, nonatomic) TKState *offState;
@property (strong, nonatomic) TKState *onState;

@property (strong, nonatomic) TKEvent *powerOnTransition;
@property (strong, nonatomic) TKEvent *powerOffTransition;

@end
