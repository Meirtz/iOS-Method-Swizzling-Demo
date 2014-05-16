//
//  iOS_Method_Swizzling_Demo.m
//  iOS Method Swizzling Demo
//
//  Created by Meirtz on 14-5-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "iOS_Method_Swizzling_Demo.h"

@implementation iOS_Method_Swizzling_Demo

-(id)init
{
	if ((self = [super init]))
	{
	}
    
	return self;
}

static void __attribute__((constructor)) initialize(void){
    
    NSLog(@"--------------------------INITIALIZED--------------------------");//work
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Meirtz Method Swizzling"
                                                   message:@"INITIALIZED"
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert1 show];//dead
    Class originalClass = NSClassFromString(@"SBAwayController ");
	Method originalMeth = class_getInstanceMethod(originalClass, @selector(activate));
	sOriginalImp = method_getImplementation(originalMeth);
	
	Method replacementMeth = class_getInstanceMethod(NSClassFromString(@"MCPasscodeManager"), @selector(patchedActivate));
	method_exchangeImplementations(originalMeth, replacementMeth);//dead
}

-(void)patchedActivate{//dead
    sOriginalImp(self, @selector(activate), self);
    
    NSLog(@"--------------------------INJECTED--------------------------");
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Meirtz Method Swizzling"
                                                  message:@"INJECTED"
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                           
                                        otherButtonTitles:nil];
    [alert2 show];
}

@end