//
//  ViewController.h
//  LocalNotificationTestApp
//
//  Created by Mohit Jain on 3/15/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate> {
    
    int flag1;
    
}

@property(nonatomic, strong) IBOutlet UIButton *setNotification;
@property(nonatomic) int flag1;
@property(nonatomic, strong) UIView *view1;

- (IBAction)setNotificationForMessageDisplay: (id)sender;
- (void)showReminder:(NSString *)text;
- (void)clearNotification;

+ (id)sharedManager;

@end
