//
//  MyDocument.m
//  ios20121026_document
//
//  Created by sdt5 on 12. 10. 26..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument {
@private
    NSString *_textContents;
}

@synthesize textContents = _textContents;


- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError {
    self.textContents = [[NSString alloc] initWithData:contents encoding:NSUTF8StringEncoding];
    DebugLog(@"loadFromContents: %@", self.textContents);
    return YES;
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
    DebugLog(@"contentsForType: %@", self.textContents);
    NSData *data = [self.textContents dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

@end
