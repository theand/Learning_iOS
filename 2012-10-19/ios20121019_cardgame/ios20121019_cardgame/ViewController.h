//
//  ViewController.h
//  ios20121019_cardgame
//
//  Created by sdt5 on 10/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *compCard1;
@property (weak, nonatomic) IBOutlet UIImageView *compCard2;
@property (weak, nonatomic) IBOutlet UIImageView *compCard3;
@property (weak, nonatomic) IBOutlet UIImageView *compCard4;
@property (weak, nonatomic) IBOutlet UIImageView *compCard5;

@property (weak, nonatomic) IBOutlet UIImageView *playerCard1;
@property (weak, nonatomic) IBOutlet UIImageView *playerCard2;
@property (weak, nonatomic) IBOutlet UIImageView *playerCard3;
@property (weak, nonatomic) IBOutlet UIImageView *playerCard4;
@property (weak, nonatomic) IBOutlet UIImageView *playerCard5;

@property (weak, nonatomic) IBOutlet UIImageView *compFightCard;
@property (weak, nonatomic) IBOutlet UIImageView *playerFightCard;

@property (weak, nonatomic) IBOutlet UIImageView *imageShadow1;
@property (weak, nonatomic) IBOutlet UIImageView *imageShadow2;
@property (weak, nonatomic) IBOutlet UIImageView *imageShadow3;
@property (weak, nonatomic) IBOutlet UIImageView *imageShadow4;
@property (weak, nonatomic) IBOutlet UIImageView *imageShadow5;

@property (weak, nonatomic) IBOutlet UILabel *compScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameCountLabel;
@property(nonatomic) BOOL doesPlayerHaveEmperor;

- (IBAction)doRestart:(id)sender;

@end
