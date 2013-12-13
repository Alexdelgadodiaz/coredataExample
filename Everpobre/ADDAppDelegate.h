//
//  ADDAppDelegate.h
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AGTCoreDataStack; 

@interface ADDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AGTCoreDataStack *model;

@end
