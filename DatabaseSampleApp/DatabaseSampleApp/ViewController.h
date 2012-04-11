//
//  ViewController.h
//  DatabaseSampleApp
//
//  Created by Mohit Jain on 4/10/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController {
    
    UITextField *name;
    UITextField *address;
    UITextField *phone;
    UILabel *status;
    NSString *databasePath;
    
    sqlite3 *contactDB;
}

@property (retain, nonatomic) IBOutlet UITextField *name;
@property (retain, nonatomic) IBOutlet UITextField *address;
@property (retain, nonatomic) IBOutlet UITextField *phone;
@property (retain, nonatomic) IBOutlet UILabel *status;


- (IBAction)saveData:(id)sender;

- (IBAction)findContact:(id)sender;

@end
