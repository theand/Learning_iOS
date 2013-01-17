//
//  MovieCell.h
//  ios20121017_xml
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *director;
@property (weak, nonatomic) IBOutlet UILabel *actor;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

-(void) setMovieData:(Movie *)mov;
@end
