//
//  WaitView.h
//  GTunes
//
//  Created by huangzan on 09-5-4.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUIView.h"


@interface WaitView : BaseUIView


+ (WaitView *) sharedInstance ;
-(void)start;
-(void)stop;

-(void)setStateText:(NSString*)text;
@end
