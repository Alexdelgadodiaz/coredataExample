//
//  ADDAppDelegate.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "ADDAppDelegate.h"
#import "AGTCoreDataStack.h"
#import "AGTnote.h"
#import "AGTnoteBook.h"
#import "ADDNotebookViewController.h"
#import "UIViewController+Navigation.h"

@implementation ADDAppDelegate

- (void) trastearConObjetos{
    
    AGTnoteBook *nb = [AGTnoteBook notebookWithName:@"new notebook"
                                          inContext:self.model.context];

    nb.name = @"Primera libreta";
    
    AGTnote *note =[AGTnote noteWithName:@"una nota"
                                notebook:nb
                               inContext:self.model.context];
    
    AGTnote *note2 =[AGTnote noteWithName:@"otra nota"
                                notebook:nb
                               inContext:self.model.context];
    
    //guardar
    [self.model saveWithErrorBlock:^(NSError *error){
        NSLog(@"La cagamos! %@", error);
        
    }];
    
    //buscar
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTnote entityName]];
    
    NSArray *result= [self.model.context executeFetchRequest:req error:nil];
    
    

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.model = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self trastearConObjetos];
    
    
    //Creamos la busqueda
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTnoteBook entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"modifyDate" ascending:NO],
                            [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    //creo el fetchedcontroller
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc]initWithFetchRequest:req
                                                                             managedObjectContext:self.model.context
                                                                               sectionNameKeyPath:nil
                                                                                        cacheName:nil];
    
    //Crear el controlador de libretas
    ADDNotebookViewController *nbVC = [[ADDNotebookViewController alloc]initWithFetchedResultsController:fetched style:UITableViewStylePlain];
    
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [nbVC wrappedInNavigationController];
    
   // self.window.rootViewController = nbVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self autoSave];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [self.model saveWithErrorBlock:^(NSError *error){
        NSLog(@"Error al guardar %@", error);
    }];
    
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    [self.model saveWithErrorBlock:^(NSError *error){
        NSLog(@"Error al guardar %@", error);
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)autoSave{
    if (AUTO_SAVE) {
        [self.model saveWithErrorBlock:^(NSError *error){
            NSLog(@"Error al autoguardado");
        }];
        
        NSLog(@"Auto guardado");
        
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY];
    }

}

@end
