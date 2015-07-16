//
//  AppViewController.m
//  ProjectApp
//
//  Created by libj on 15/7/15.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import "AppViewController.h"

@implementation AppViewController

#pragma mark --

-(void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark --

- (IBAction)commonTestClick:(id)sender {
    [self performSegueWithIdentifier:@"toCommonTest" sender:self];
}


@end
