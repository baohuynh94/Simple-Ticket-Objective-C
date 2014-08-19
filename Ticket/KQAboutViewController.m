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
@synthesize tableInfo, bgImage;

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
    
    // Set image data
    [bgImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Set data for arrays
    appInfo = [[NSMutableArray alloc] init];
    phoneInfo = [[NSMutableArray alloc] init];
    appInfoTitle = [[NSMutableArray alloc] init];
    phoneInfoTitle = [[NSMutableArray alloc] init];
    
    // App information
    NSString *appName=[[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleName"];
    [appInfoTitle addObject:@"Tên gói ứng dụng"];
    [appInfo addObject:appName];
    NSString *versionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
    [appInfoTitle addObject:@"Phiên bản"];
    [appInfo addObject:versionString];
    
    // Device information
    [phoneInfoTitle addObject:@"Tên thiết bị"];
    [phoneInfo addObject:[[UIDevice currentDevice] name]];
    [phoneInfoTitle addObject:@"Hệ điều hành"];
    [phoneInfo addObject:[[UIDevice currentDevice] model]];
    [phoneInfoTitle addObject:@"Model"];
    [phoneInfo addObject:[[UIDevice currentDevice] localizedModel]];
    
    tableInfo.delegate = self;
    tableInfo.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return [appInfo count];
    }
    else {
        return [phoneInfo count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"Thông tin phiên bản";
    }
    else {
        return @"Thông tin thiết bị";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"infoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    if (indexPath.section == 1) {
        [cell.textLabel setText:[appInfoTitle objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:[appInfo objectAtIndex:indexPath.row]];
    }
    else {
        [cell.textLabel setText:[phoneInfoTitle objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:[phoneInfo objectAtIndex:indexPath.row]];
    }
    
    return cell;
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
