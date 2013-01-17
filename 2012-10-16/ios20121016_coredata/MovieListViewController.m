//
//  MovieListViewController.m
//  ios20121016_coredata
//
//  Created by sdt5 on 12. 10. 16..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MovieListViewController.h"
#import "AppDelegate.h"
#import "Movie.h"
#import "Actor.h"


@interface MovieListViewController ()

@end

@implementation MovieListViewController

- (void) addData:(NSString *)input{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //init object
    Movie *mov = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:appDelegate.managedObjectContext];

    //set values
    mov.title = input;

    //stores
    __autoreleasing NSError *error = nil;
    BOOL ret = [appDelegate.managedObjectContext save:&error];
    if ( ret == NO){
        NSLog(@"Error: %@", [error localizedDescription]);
    }

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self addData:@"회사원"];
//    [self addData:@"광해"];
//    [self addData:@"용의자X의 헌신"];

    [self resolveData];

}

- (void)resolveData {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    req.entity = [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:app.managedObjectContext];

    __autoreleasing NSError *error = nil;
    NSArray *result = [app.managedObjectContext executeFetchRequest:req error:&error];

    if ( nil!= error){
        NSLog(@"Error: %@", [error localizedDescription]);
    }

    for ( Movie *m in result){
        NSLog(@"movie title: %@", m.title);
        Actor *actor = [NSEntityDescription insertNewObjectForEntityForName:@"Actor" inManagedObjectContext:app.managedObjectContext];
        actor.name = @"Rabbit";
        actor.image = @"image.png";
        [m addActorsObject:actor];
        BOOL ret = [app.managedObjectContext save:&error];
        if ( ret == NO){
            NSLog(@"Error: %@", [error localizedDescription]);
        }

    }


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
