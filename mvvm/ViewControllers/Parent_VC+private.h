//
//  Parent_VC+Parent_VC_private_h.h
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Parent_VC.h"

@class Parent_VM;

@interface Parent_VC ()

@property (strong, nonatomic) Parent_VM *viewmodel;

@property (weak, nonatomic) IBOutlet UIView *loginIndicator;
@property (weak, nonatomic) IBOutlet UIButton *logmeButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end
