//
//  ViewController.m
//  LocalNotificationTestApp
//
//  Created by Mohit Jain on 3/15/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DisplayViewController.h"


static ViewController *sharedMyManager = nil;

@implementation ViewController
@synthesize setNotification, flag1, view1;

#pragma mark Singleton Methods
+ (id)sharedManager {
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


// Clear All Notifications

- (void)clearNotification {
	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}


// Setting Notifications - 

-(void)setNotificationMessage {
    
    [self clearNotification];
    
    
	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls != nil) {
		
		UILocalNotification *notif = [[cls alloc] init];
     
        
        NSDate *date = [NSDate date]; 
        
        // Add 5 sec to the current time
        NSDate *dateToFire = [date dateByAddingTimeInterval:10];
        
        
        
        [notif setFireDate:dateToFire];

		notif.timeZone = [NSTimeZone defaultTimeZone];
		
        
        // Create a payload to go along with the notification
        NSArray *array = [NSArray arrayWithObjects:@"Value 1", @"Value 2", nil];
        
           NSDictionary *userDict = [NSDictionary dictionaryWithObject:array forKey:kRemindMeNotificationDataKey];
        
        notif.userInfo = userDict;

        
		notif.alertBody = @"The Secret message is waiting for you :)";
		notif.alertAction = @"Show me";
		notif.soundName = UILocalNotificationDefaultSoundName;
        [notif setHasAction:YES]; 
		notif.applicationIconBadgeNumber = 1;        	
        
        
		[[UIApplication sharedApplication] scheduleLocalNotification:notif];
    /*
       ViewController *sharedManager = [ViewController sharedManager];
        if(sharedManager.flag1 ==0) {
        DisplayViewController *displayViewController2= [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil];
        
        [self.view insertSubview:displayViewController2.view atIndex:0]; 
     }
     */
        
		
	}
}

- (id)init {
    if (self = [super init]) {
        flag1 = 0;
    }
    return self;
}



- (void)showReminder:(NSString *)text {
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
                                                        message:text delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"View",nil];
	[alertView show];
	    
    
}





- (IBAction)setNotificationForMessageDisplay: (id)sender {
    
    [self setNotificationMessage];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    // Return YES for supported orientations
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
    
    return YES;
}

@end
