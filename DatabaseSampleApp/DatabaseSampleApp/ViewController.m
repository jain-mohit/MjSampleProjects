//
//  ViewController.m
//  DatabaseSampleApp
//
//  Created by Mohit Jain on 4/10/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize name, address, phone, status;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    
    // Get documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file and naming it contacts.db
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    
    // Creates an NSFileManager instance and subsequently uses it to detect if the database file already exists.
       
       NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
   //  If the file does not yet exist the code converts the path to a UTF-8 string and creates the database via a call to the SQLite sqlite3_open() function, passing through a reference to the contactDB variable declared previously in the interface file.
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
		const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                status.text = @"Failed to create table";
            }
            
            sqlite3_close(contactDB);
            
        } else {
            status.text = @"Failed to open/create database";
        }
    }
    
    [filemgr release];
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.name = nil;
    self.address = nil;
    self.phone = nil;
    self.status = nil;
    
    
}

- (void)dealloc {
    
    [name release];
    [address release];
    [phone release];
	[status release];
    [super dealloc];
}


#pragma mark - Custom Actions

- (IBAction)saveData:(id)sender {
    
    sqlite3_stmt  *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CONTACTS (name, address, phone) VALUES (\"%@\", \"%@\", \"%@\")", name.text, address.text, phone.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        
        // this function must be called one or more times to evaluate the statement.
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            status.text = @"Contact added";
            name.text = @"";
            address.text = @"";
            phone.text = @"";
        } else {
            status.text = @"Failed to add contact";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
    
    
}


- (IBAction)findContact:(id)sender {
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT address, phone FROM contacts WHERE name=\"%@\"", name.text];
        
        const char *query_stmt = [querySQL UTF8String];
        
       
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                address.text = addressField;
                
                NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                phone.text = phoneField;
                
                status.text = @"Match found";
                
                [addressField release];
                [phoneField release];
            } else {
                status.text = @"Match not found";
                address.text = @"";
                phone.text = @"";
            }
            
            //deleting a prepared statement which is created by using sqlite3_prepare_v2()
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
}

// Dismiss Keyboard


- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
    
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
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
