//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationController *) wrappedInNavigationController{
    
    UINavigationController *navVC = [[UINavigationController alloc]init];
    
    [navVC pushViewController:self animated:NO];
    
    return navVC;
}

@end