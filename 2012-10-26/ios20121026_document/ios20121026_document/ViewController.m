//
//  ViewController.m
//  ios20121026_document
//
//  Created by sdt5 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MyDocument.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self OpenFile];
}

- (void)OpenFile {
    NSString *docFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docFolder stringByAppendingPathComponent:@"first.md"];
    NSURL *url = [NSURL fileURLWithPath:filePath];

    MyDocument *doc = [[MyDocument alloc] initWithFileURL:url];
    [doc openWithCompletionHandler:^(BOOL success){
        DebugLog(@"open : %d", success);
        self.theTextView.text = doc.textContents;
        DebugLog(@"file content: %@", doc.textContents)  ;
    }];



}

- (void)viewDidUnload {
    [self setTheTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)saveHandler:(id)sender {
    NSString *docFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docFolder stringByAppendingPathComponent:@"first.md"];
    DebugLog(@"filePath: %@", filePath);
    NSURL *url = [NSURL fileURLWithPath:filePath];
    DebugLog(@"url : %@",  url);
    MyDocument *doc = [[MyDocument alloc] initWithFileURL:url];
    doc.textContents = theTextView .text;
    [doc saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
        DebugLog(@"save : %d", success);
    }];
}
@end
