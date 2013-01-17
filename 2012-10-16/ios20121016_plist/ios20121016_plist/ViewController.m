//
//  ViewController.m
//  ios20121016_plist
//
//  Created by sdt5 on 10/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define STRING_KEY @"StringKey"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self userPlist];

    [self useUserDefaults];

}


- (void)useUserDefaults {
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting setObject:@"Jeju" forKey:STRING_KEY];

    NSUserDefaults *setting2 = [NSUserDefaults standardUserDefaults];
    NSString *ret = [setting2 objectForKey:STRING_KEY];

    NSLog(@"Setting: %@", ret);
}

- (void)userPlist {
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [folders objectAtIndex:0];
    NSLog(@"docPath: %@", path);

    NSString *filePath = [path stringByAppendingPathComponent:@"/data.plist"];
    NSLog(@"filePath: %@", filePath);

    NSArray *data = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil];

    BOOL ret = [data writeToFile:filePath atomically:YES];
    NSLog(@"ret: %d", ret);

    NSArray *data2 = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSLog(@"array: %@", data2);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getSetting:(id)sender {

    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    NSString *name = [setting stringForKey:@"name_preference"];
    NSLog(@"name: %@", name);
}
@end
