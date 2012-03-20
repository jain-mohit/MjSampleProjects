//
//  AppDelegate.h
//  LocalNotificationTestApp
//
//  Created by Mohit Jain on 3/15/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class DisplayViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate> {
}




@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) DisplayViewController *displayViewController;
@property (strong, nonatomic) UIView *view;

extern NSString *kRemindMeNotificationDataKey;


@end
