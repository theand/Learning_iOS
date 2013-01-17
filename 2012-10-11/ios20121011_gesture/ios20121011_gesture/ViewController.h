//
//  ViewController.h
//  ios20121011_gesture
//
//  Created by sdt5 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//TODO IB 에서  pinch 에 워닝 뜸.

//TODO  핀치 제스처 연결이 안되네. alt + 클릭으로 해야했음.
-(IBAction)handlePinch:(UIPinchGestureRecognizer *)gesture;

-(IBAction)handleTap:(UITapGestureRecognizer *)gesture;
@end
