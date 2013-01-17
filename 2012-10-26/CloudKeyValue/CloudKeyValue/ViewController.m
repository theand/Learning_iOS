//
//  ViewController.m
//  CloudKeyValue
//
//  Created by sdt5 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define KEY @"TACADEMY_TEST"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSUbiquitousKeyValueStore *store = [NSUbiquitousKeyValueStore defaultStore];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleChange:) name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:store];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUbiquitousKeyValueStore *store = [NSUbiquitousKeyValueStore defaultStore];
    NSString *sharedValue = [store stringForKey:KEY];

    theTextField.text = sharedValue;
}

- (void)viewDidUnload
{
    [self setTheTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)handleChange:(NSNotification *)noti{
    DebugLog(@"noti : %@", noti);

    NSUbiquitousKeyValueStore *store = noti.object;
    NSString *changedValue = [store stringForKey:KEY];
    NSString *msg = [NSString stringWithFormat:@"%@ -> %@", theTextField.text, changedValue];
    theTextField.text = changedValue;

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Changed" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSUbiquitousKeyValueStore *store = [NSUbiquitousKeyValueStore defaultStore];
    [store setString:textField.text forKey:KEY];
    BOOL ret = [store synchronize];
    if( ret == NO){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        DebugLog(@"Uploaded");
    }


    [textField resignFirstResponder];
    return YES;
}


@end
