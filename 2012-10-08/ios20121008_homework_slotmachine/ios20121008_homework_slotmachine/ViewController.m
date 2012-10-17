//
//  ViewController.m
//  ios20121008_homework_slotmachine
//
//  Created by sdt5 on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// ios  과정 - 채희상
// 과제 #2
// 제출일 : 2012.10.12

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *slot[3];
    UIImage *images[10];
    int currentMoneyValue;
    int bettingMoneyValue;
    int currentIndex[3];
    int previousIndex[3];
    int dy;

}
@synthesize bettingField;
@synthesize currentField;
@synthesize picker;
@synthesize startButton;


- (void)viewDidLoad {
    [super viewDidLoad];

    [self initPicker];

    [self initInputField];

    [self initKeyboard];

}

- (void)initInputField {
    currentMoneyValue = 1000;
    bettingMoneyValue = 0;
    bettingField.keyboardType = UIKeyboardTypeNumberPad;

    [self setCurrentField];
    [self setBettingField];
}

- (void)initPicker {
    slot[0] = [[NSMutableArray alloc] initWithCapacity:100];
    slot[1] = [[NSMutableArray alloc] initWithCapacity:100];
    slot[2] = [[NSMutableArray alloc] initWithCapacity:100];

    NSArray *names = [[NSArray alloc] initWithObjects:
            @"Apple.png",
            @"Apricot.png",
            @"Banana.png",
            @"Cherry.png",
            @"Kiwi.png",
            @"Lemon.png",
            @"Mango.png",
            @"Pear.png",
            @"Strawberry.png",
            @"Tomato.png", nil];

    for (int i = 0; i < [names count]; i++) {
        images[i] = [UIImage imageNamed:[names objectAtIndex:i]];
    }
    for (int i = 0; i < 100; i++) {
        [slot[0] addObject:images[i % 10]];
        [slot[1] addObject:images[i % 10]];
        [slot[2] addObject:images[i % 10]];
    }

    picker.userInteractionEnabled = NO;
}

- (void)initKeyboard {
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlack;

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [toolbar setItems:[NSArray arrayWithObjects:space, doneButton, nil]];

    bettingField.inputAccessoryView = toolbar;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}


- (void)setBettingField {
//    NSLog(@"bettingField.text = %@", bettingField.text);
    bettingMoneyValue = [bettingField.text intValue];
    bettingField.text = [[NSString alloc] initWithFormat:@"%d$", bettingMoneyValue];

    NSLog(@"bettingMoneyValue = %d", bettingMoneyValue);
    NSLog(@"curentMoneyValue = %d", currentMoneyValue);

}

- (void)setCurrentField {
    currentField.text = [[NSString alloc] initWithFormat:@"%d$", currentMoneyValue];
}


- (void)viewDidUnload {
    [self setPicker:nil];
    [self setBettingField:nil];
    [self setCurrentField:nil];
    [self setStartButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (BOOL)checkBalance {
    if ( bettingMoneyValue == 0){
        NSLog(@"베팅 금액 미설정");
        UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"베팅금액 미설정" message:@"베팅 금액을 설정하셔야 게임이 진행됩니다" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [v show];
        return NO;
    }

    if (currentMoneyValue < bettingMoneyValue) {
        bettingMoneyValue = 0;
        [self setBettingField];

        NSLog(@"잔액 부족");
        UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"잔액부족" message:@"현재 배팅금액으로는 잔액부족으로 인해 더이상 게임을 진행할 수 없습니다" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [v show];
        return NO;
    }else{
        return YES;
    }
}

- (IBAction)startTouched:(id)sender {
    NSLog(@"-------Start-------");

    bettingMoneyValue = [bettingField.text intValue];

    if ( [self checkBalance] == NO ){
        return;
    }

    [self rotateSlot];

//    currentIndex[0] = 25;
//    currentIndex[1] = 35;
//    currentIndex[2] = 95;

    int result = [self checkMatch];

    currentMoneyValue += result;
    [self setCurrentField];

}

- (void)rotateSlot {
    for (int i = 0; i < 3; i++) {
        previousIndex[i] = currentIndex[i];
        currentIndex[i] = arc4random() % 100;
        if (abs(previousIndex[i] - currentIndex[i]) < 20) {
            NSLog(@"too small distance in %d slot :  coordinate %d to %d", i, currentIndex[i], currentIndex[i] + 20);
            currentIndex[i] = (currentIndex[i] + 20) % 100;
        }
//        NSLog(@"%d slot previous number - %d", i, previousIndex[i]);
//        NSLog(@"%d slot current number - %d (%d) ", i, currentIndex[i], currentIndex[i] % 10);
//        NSLog(@"%d slot distance - %d", i, abs(previousIndex[i] - currentIndex[i]));
        [picker selectRow:currentIndex[i] inComponent:i animated:YES];
    }
}

- (int)checkMatch {
    if (currentIndex[0] % 10 == currentIndex[1] % 10 && currentIndex[1] % 10 == currentIndex[2] % 10) {
        NSLog(@"√√√√√√√√√√√√√√√√\tMatch Found! (%d)", currentIndex[0] % 10);
        int result = bettingMoneyValue * ((currentIndex[0] % 10) + 1) * 10;//n*10 배)
        NSLog(@"Reward is %d", result);
        return result;
    } else {
        NSLog(@"You lose %d", bettingMoneyValue);
        return -bettingMoneyValue;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [slot[component] count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 70;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImageView *imgView;
    if (view == nil) {
        imgView = [[UIImageView alloc] initWithImage:[slot[component] objectAtIndex:row]];
        imgView.frame = CGRectMake(0, 0, 64, 64);
    } else {
        imgView = (UIImageView *) view;
        imgView.image = [slot[component] objectAtIndex:row];
    }
    return imgView;
}


-(void) handleDone:(id)sender{
    [self setBettingField];
    [bettingField resignFirstResponder];
    self.view.center = CGPointMake(self.view.center.x, self.view.center.y+dy);
}

-(void) keyboardWillShow:(id) sender{
    UITextField *firstResponder = (UITextField *) bettingField;
    int y = firstResponder.frame.origin.y + firstResponder.frame.size.height + 5;
    int viewHeight = self.view.frame.size.height;

    NSDictionary *userInfo = [sender userInfo];
    CGRect r = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    int keyboardHeight = (int) r.size.height;

    float animationDurtion = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];

    if( keyboardHeight > (viewHeight-y) ){
        dy = keyboardHeight - (viewHeight-y);
        self.view.center = CGPointMake(self.view.center.x, self.view.center.y-dy);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self setBettingField];
    [textField resignFirstResponder];
    self.view.center = CGPointMake(self.view.center.x, self.view.center.y+dy);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    bettingField.text = @"";
}


@end
