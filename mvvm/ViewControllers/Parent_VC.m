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
    


    
    
}

@end
