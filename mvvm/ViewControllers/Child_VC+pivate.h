//
//  Child_VC+pivate.h
//  mvvm
//
//  Created by Pascal Drouilly on 27/09/14.
//  Copyright (c) 2014 PMU. All rights reserved.
//

#import "Child_VC.h"

@class Child_VM;

@interface Child_VC ()

@property (strong, nonatomic) Child_VM *viewmodel;

- (IBAction)flip:(id)sender;

@end
