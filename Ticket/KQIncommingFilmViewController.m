//
//  KQIncommingFilmViewController.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQIncommingFilmViewController.h"

@interface KQIncommingFilmViewController ()

@end

@implementation KQIncommingFilmViewController

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
    
    // Connect database
    NSString *databaseFileName = @"dulieuphim.sqlite";
    NSString *databaseFullPath = [[NSString alloc] initWithString:[[KQFileManager getSharedInstance] getFullPathInDocumentForFile:databaseFileName]];
    [[KQDBManager getSharedInstance] connectDatabaseWithName:databaseFullPath];
    
    // Get data incomming phim from database
    tenPhim = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"TenPhim"]];
    anhBia = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"AnhBia"]];
    theLoai = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"TheLoai"]];
    noiDung = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"NoiDung"]];
    doDai = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"DoDai"]];
    idPhim = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"DangChieu" withColumn:@"idPhim"]];
    
    // Close connection
    [[KQDBManager getSharedInstance] disconnectDatabase];
    
    // Set table datasource & delegate
    _tableFilm.delegate = self;
    _tableFilm.dataSource = self;
    
    
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tenPhim count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cellFilm";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    // Set imageView
    NSString *fullPathImage = [[NSString alloc] initWithString:[[KQFileManager getSharedInstance] getFullPathInDocumentForFile:[anhBia objectAtIndex:indexPath.row]]];
    [(UIImageView *)[cell viewWithTag:10] setImage:[UIImage imageWithContentsOfFile:fullPathImage]];
    
    // Set UILabel
    [(UILabel *)[cell viewWithTag:11] setText:[tenPhim objectAtIndex:indexPath.row]];
    [(UILabel *)[cell viewWithTag:12] setText:[theLoai objectAtIndex:indexPath.row]];
    [(UILabel *)[cell viewWithTag:13] setText:[doDai objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark -  Delegate Table Film
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[tenPhim objectAtIndex:indexPath.row] message:[noiDung objectAtIndex:indexPath.row] delegate:self cancelButtonTitle:@"Đồng ý" otherButtonTitles:@"Chi tiết", nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
