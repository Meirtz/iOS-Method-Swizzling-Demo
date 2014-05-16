//
//  iOS_Method_Swizzling_Demo.h
//  iOS Method Swizzling Demo
//
//  Created by Meirtz on 14-5-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include <stdio.h>
#include <objc/runtime.h>

static IMP sOriginalImp = NULL;

@interface iOS_Method_Swizzling_Demo : NSObject

-(void)patchedActivate;

@end