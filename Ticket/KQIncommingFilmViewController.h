//
//  KQIncommingFilmViewController.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KQFileManager.h"
#import "KQDBManager.h"
#import "KQDFilmDetailsViewController.h"

@interface KQIncommingFilmViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *table_View;
    
    NSMutableArray *tenPhim;
    NSMutableArray *anhBia;
    NSMutableArray *theLoai;
    NSMutableArray *noiDung;
    NSMutableArray *doDai;
    NSMutableArray *idPhim;
    NSMutableArray *codePhim;
}

@property (strong, nonatomic) IBOutlet UITableView *tableFilm;

// 2 buttons
@property (nonatomic, retain) IBOutlet BButton *btnBack;

@end
