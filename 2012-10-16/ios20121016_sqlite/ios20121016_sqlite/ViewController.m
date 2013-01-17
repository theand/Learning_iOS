//
//  ViewController.m
//  ios20121016_sqlite
//
//  Created by sdt5 on 10/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "Movie.h"

@interface ViewController ()

@end

@implementation ViewController{
    sqlite3 *db;
    NSMutableArray *data;
}
@synthesize theTextField;
@synthesize theTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [[NSMutableArray alloc] init];

    [self openDB];
//    [self addData:@"회사원"];
//    [self addData:@"강남"];
//    [self searchTitle:@"회사원"];
}

- (void)searchTitle:(NSString *)input {

}


- (void)addData:(NSString *)input {
    NSString *sql = [NSString stringWithFormat:@"insert into movie(title) values ('%@')", input];
    NSLog(@"SQL : %@", sql);

    char *errMsg;
    int ret = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errMsg);
    NSAssert1(SQLITE_OK == ret , @"Erro %sr", sqlite3_errmsg(db));

    [self fetchAll];


}

- (void)openDB {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"db.sqlite"];

    NSLog(@"filePath : %@", filePath);

    int ret = sqlite3_open([filePath UTF8String], &db);
    NSAssert1(SQLITE_OK == ret , @"Erro %sr", sqlite3_errmsg(db));


    const char *createSQL = "create table if not exists MOVIE(title text)";
    char *msg ;
    ret = sqlite3_exec(db, createSQL, NULL, NULL, &msg);
    NSAssert1(SQLITE_OK == ret , @"Erro %sr", sqlite3_errmsg(db));
}

- (void)viewDidUnload
{
    [self setTheTextField:nil];
    [self setTheTable:nil];
    [super viewDidUnload];

    sqlite3_close(db);
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchAll];
}

- (void)fetchAll {
    [data removeAllObjects];

    NSString *queryStr = @"select rowid, title from movie";
    sqlite3_stmt *stmt;
    int ret = sqlite3_prepare_v2(db, [queryStr UTF8String], -1, &stmt, NULL);

    NSAssert2(SQLITE_OK == ret, @"Error(%d) on fetching data : %s", ret, sqlite3_errmsg(db));

    while ( SQLITE_ROW == sqlite3_step(stmt)){
        int rowID = sqlite3_column_int(stmt, 0);
        char *title = (char *) sqlite3_column_text(stmt, 1);

        Movie *obj = [[Movie alloc] init];
        obj.rowID = rowID;
        obj.title = [NSString stringWithCString:title encoding:NSUTF8StringEncoding];

        [data addObject:obj];
    }

    sqlite3_finalize(stmt);

    [theTable reloadData];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MOVIECELL"];
    cell.textLabel.text = ((Movie *)[data objectAtIndex:indexPath.row]).title;
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField.text length] > 1){
        [self addData:textField.text];
        [textField resignFirstResponder];
        textField.text = @"";
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if ( editingStyle != UITableViewCellEditingStyleDelete)
        return;

    Movie *obj = [data objectAtIndex:indexPath.row];
    NSString *sql = [NSString stringWithFormat:@"delete from movie where rowid=%d", obj.rowID];

    char * errMsg;
    int ret = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errMsg);
    NSAssert1(SQLITE_OK == ret , @"Erro %sr", sqlite3_errmsg(db));

    [self fetchAll];

}

@end
