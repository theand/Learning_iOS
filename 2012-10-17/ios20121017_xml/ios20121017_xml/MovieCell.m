//
//  MovieCell.m
//  ios20121017_xml
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell {
}

@synthesize title;
@synthesize subtitle;
@synthesize director;
@synthesize actor;
@synthesize thumbnail;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovieData:(Movie *)mov {
    self.title.text = mov.title;
    self.subtitle.text = mov.subtitle;

    NSURL *url = [NSURL URLWithString:mov.image];
    NSData *image = [NSData dataWithContentsOfURL:url];
    self.thumbnail.image = [UIImage imageWithData:image];

    self.director.text = [NSString stringWithFormat:@"감독 : %@", mov.director];
    self.actor.text = [NSString stringWithFormat:@"주연 : %@", mov.actor];
}



@end
