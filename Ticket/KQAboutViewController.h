//
//  KQAboutViewController.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"

@interface KQAboutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *appInfo;
    NSMutableArray *phoneInfo;
    NSMutableArray *appInfoTitle;
    NSMutableArray *phoneInfoTitle;
}

@property (strong, nonatomic) IBOutlet UITableView *tableInfo;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;

@end
