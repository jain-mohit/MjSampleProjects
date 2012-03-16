//
//  AppDelegate.m
//  LocalNotificationTestApp
//
//  Created by Mohit Jain on 3/15/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController; 
@synthesize displayViewController; 
@synthesize view;

NSString *kRemindMeNotificationDataKey = @"kRemindMeNotificationDataKey";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    
    
    Class cls = NSClassFromString(@"UILocalNotification");
	if (cls) {
		UILocalNotification *notification = [launchOptions objectForKey:
                                             UIApplicationLaunchOptionsLocalNotificationKey];
		
		if (notification) {
            NSString *reminderText = [notification.userInfo 
									  objectForKey:kRemindMeNotificationDataKey];
			[viewController showReminder:reminderText];
           
            
		}
	}
	
	application.applicationIconBadgeNumber = 0;
    [_window addSubview:viewController.view];
    //  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	
	application.applicationIconBadgeNumber = 0;
}



- (void)application:(UIApplication *)application 
didReceiveLocalNotification:(UILocalNotification *)notification {

	application.applicationIconBadgeNumber = 0;
    
}

/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // if (actionSheet == actionSheet) {
    if (buttonIndex == 0) {
        
        DisplayViewController *displayViewController1= [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil];
        
        [self.view insertSubview:displayViewController1.view atIndex:1];
    }
    if (buttonIndex == 2) {
        // type in an action here
    }
    
    else {
        
    }
    
    // }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
        DisplayViewController *displayViewController2= [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil];
        
        //   [addSubview:displayViewController2.view atIndex:1];
        [self.view addSubview:displayViewController2.view];
    }
    
    if (buttonIndex == 1) {
        NSLog(@"User Cancelled");
    }
    
    
}
*/
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}



- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
