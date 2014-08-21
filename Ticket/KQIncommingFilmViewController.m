//
//  KQIncommingFilmViewController.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQIncommingFilmViewController.h"
#import "KQViewController.h"

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
    
    // Set custom view
    self.title = @"Phim Đang Chiếu";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Trở về" style:UIBarButtonItemStylePlain target:self action:@selector(backToHome:)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    // Custom BtnBack
    [_btnBack setTitle:@"Trở về" forState:UIControlStateNormal];
    [_btnBack setColor:[UIColor orangeColor]];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [_tableFilm setBackgroundColor:[UIColor blackColor]];
    
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

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"thongTinPhim"]) {
        NSIndexPath *indexPath = [self.tableFilm indexPathForSelectedRow];
        KQDFilmDetailsViewController *destViewController = segue.destinationViewController;
        destViewController.idPhim = indexPath.row;
        destViewController.tenPhim = [tenPhim objectAtIndex:indexPath.row];
        destViewController.anhBia = [anhBia objectAtIndex:indexPath.row];
        destViewController.theLoai = [theLoai objectAtIndex:indexPath.row];
        destViewController.noiDung = [noiDung objectAtIndex:indexPath.row];
        destViewController.doDai = [doDai objectAtIndex:indexPath.row];
        destViewController.codePhim = [idPhim objectAtIndex:indexPath.row];
    }
}

- (void)backToHome:(id)sender {
    KQViewController *viewController = [[KQViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
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
