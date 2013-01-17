//
//  ViewController.m
//  ios20121017_sync_async_network
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define IMAGE_URL @"http://static2.businessinsider.com/image/505c9080eab8ea323300000a-2176-3000/psy-gangnam-style.jpg?maxX=400"

@implementation ViewController {
    NSMutableData *buffer;
}
@synthesize imageiew;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [self setImageiew:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handleSync:(id)sender {
    imageiew.image = nil;
    NSLog(@"%s", sel_getName(_cmd));
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:IMAGE_URL]];
    imageiew.image = [UIImage imageWithData:data];
    NSLog(@"Done - sync");
}

- (IBAction)handleAsync:(id)sender {
    imageiew.image = nil;
    NSLog(@"%s", sel_getName(_cmd));
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:IMAGE_URL]];
    [NSURLConnection connectionWithRequest:req delegate:self];

    NSLog(@"Done - Async");

}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%s : error - %@", sel_getName(_cmd), [error localizedDescription]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%s - %dyte", sel_getName(_cmd), [data length]);
    [buffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    imageiew.image = [UIImage imageWithData:buffer];
    NSLog(@"%s", sel_getName(_cmd));
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%s", sel_getName(_cmd));
    buffer = [[NSMutableData alloc] init];
}

@end
