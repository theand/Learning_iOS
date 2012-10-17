//
//  ViewController.m
//  ios20121005_text
//
//  Created by sdt5 on 12. 10. 5..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tf1;
@synthesize tf2;
@synthesize tf3;
@synthesize tf4;
@synthesize overlay;
@synthesize toolbar;

//TODO   미리 만들어놓고 오버레이, 툴바 배치하니 이미지개 2개 생기는 문제 있음.

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 1:
            return NO;
            break;
        case 3:
//            overlay.hidden = NO;
            break;
        case 4:
//            toolbar.hidden = NO;
            break;
        default:;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 3:
//            overlay.hidden = YES;
            break;
        case 4:
//            toolbar.hidden = YES;
            break;
        default:;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    tf3.rightView = overlay;
    tf3.rightViewMode = UITextFieldViewModeUnlessEditing;
    overlay.hidden = NO;
    [overlay removeFromSuperview];

    tf4.inputAccessoryView = toolbar;
    toolbar.hidden = NO;
    [toolbar removeFromSuperview];
}

- (void)viewDidUnload {
    [self setTf1:nil];
    [self setTf1:nil];
    [self setTf3:nil];
    [self setTf4:nil];
    [self setOverlay:nil];
    [self setToolbar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handleDone:(id)sender {
}


@end
