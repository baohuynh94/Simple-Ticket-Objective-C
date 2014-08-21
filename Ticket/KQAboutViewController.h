//
//  KQAboutViewController.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"
#import "KQDBManager.h"
#import "KQFileManager.h"
#import "BButton.h"

@interface KQAboutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *tenRap;
    NSArray *diaChi;
}

@property (strong, nonatomic) IBOutlet UITableView *tableInfo;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet BButton *buttonCall;

- (IBAction)callBtn:(id)sender;

@end
