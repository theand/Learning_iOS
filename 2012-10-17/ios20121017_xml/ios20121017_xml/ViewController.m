//
//  ViewController.m
//  ios20121017_xml
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "MovieCell.h"

#define TAG_ITEM @"item"

@interface ViewController () <NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    NSMutableArray *movieList;
    NSMutableString *buffer;
    BOOL InsideTag;
    NSDictionary *dict;
    Movie *currentMovie;
}
@synthesize theTable;

- (void)viewWillAppear:(BOOL)animated {

    [self parseMovieXml];

}

- (void)parseMovieXml {
    InsideTag = NO;

    //get parser
    NSXMLParser *parser;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    parser = [[NSXMLParser alloc] initWithData:xmlData];

    //delegate
    [parser setDelegate:self];

    //parse xml
    [parser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"%s", sel_getName(_cmd));
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"%s", sel_getName(_cmd));
    [theTable reloadData];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([TAG_ITEM isEqualToString:elementName]) {
        currentMovie = [[Movie alloc] init];
    } else {
        NSString *tag = (NSString *) [dict objectForKey:elementName];
        if (tag) {
            NSLog(@"tag found : %@", tag);
            InsideTag = YES;
        }
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([TAG_ITEM isEqualToString:elementName]) {
        [movieList addObject:currentMovie];
    } else {
        NSString *tag = (NSString *) [dict objectForKey:elementName];
        if (tag) {
            NSLog(@"tag close : %@", tag);
            [currentMovie setValue:[NSString stringWithString:buffer] forKey:tag];
            [buffer setString:@""];
            InsideTag = NO;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (InsideTag) {
        [buffer appendString:string];
        NSLog(@"%s - %@", sel_getName(_cmd), string);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    movieList = [[NSMutableArray alloc] init];
    buffer = [[NSMutableString alloc] init];

    NSArray *obj = [[NSArray alloc] initWithObjects:@"title", @"link", @"image", @"subtitle", @"pubDate", @"director", @"actor", @"userRating", nil];
    NSArray *key = [[NSArray alloc] initWithArray:obj];
    dict = [[NSDictionary alloc] initWithObjects:obj forKeys:key];

}

- (void)viewDidUnload {
    [self setTheTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [movieList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:@"MOVIECELL"];
    [cell setMovieData:[movieList objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 61;
}

@end
