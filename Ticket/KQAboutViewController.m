//
//  KQAboutViewController.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQAboutViewController.h"

@interface KQAboutViewController ()

@end

@implementation KQAboutViewController
@synthesize tableInfo, bgImage, buttonCall;

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
    
    // Custom button
    [buttonCall setTitle:@"Gọi Đặt Vé" forState:UIControlStateNormal];
    [buttonCall setColor:[UIColor grayColor]];
    
    // Connect to db
    [[KQDBManager getSharedInstance] connectDatabaseWithName:[[KQFileManager getSharedInstance] getFullPathInDocumentForFile:@"dulieuphim.sqlite"]];
    
    // Get data
    tenRap = [[NSArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"RapChieu" withColumn:@"TenRap"]];
    diaChi = [[NSArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"RapChieu" withColumn:@"DiaChi"]];
    
    // Close connection
    [[KQDBManager getSharedInstance] disconnectDatabase];
    
    tableInfo.delegate = self;
    tableInfo.dataSource = self;
    
    [tableInfo setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tenRap count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Thông tin rạp chiếu";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"infoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    if (indexPath.row % 2 == 0) {
        [cell setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5]];
        [cell.textLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0]];
        [cell.detailTextLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0]];
    }
    else {
        [cell setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]];
        [cell.textLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0]];
        [cell.detailTextLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0]];
    }
    [cell.textLabel setText:[tenRap objectAtIndex:indexPath.row]];
    [cell.detailTextLabel setText:[diaChi objectAtIndex:indexPath.row]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[tenRap objectAtIndex:indexPath.row] message:[diaChi objectAtIndex:indexPath.row] delegate:self cancelButtonTitle:@"Đồng ý" otherButtonTitles:nil, nil];
    [alertView show];
}

- (IBAction)callBtn:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:113"]];
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
