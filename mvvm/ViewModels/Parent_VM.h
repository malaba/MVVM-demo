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

@property (strong, nonatomic) TKState *unloggedState;
@property (strong, nonatomic) TKState *loggedState;

@end
