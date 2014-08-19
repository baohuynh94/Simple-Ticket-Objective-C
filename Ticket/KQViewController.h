//
//  KQViewController.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KQFileManager.h"
#import "KQDBManager.h"
#import <QuartzCore/QuartzCore.h>
#import "BButton.h"

@interface KQViewController : UIViewController <UIScrollViewDelegate> {
    NSMutableArray *tenPhim;
    NSMutableArray *anhBia;
    NSMutableArray *theLoai;
    NSMutableArray *noiDung;
    NSMutableArray *doDai;
    NSMutableArray *ngayChieu;
    UITabBarController *tab;
}

@property (nonatomic, retain) UITabBarController *tab;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollNewFilm;
@property (nonatomic, retain) IBOutlet UILabel *filmLength;
@property (nonatomic, retain) IBOutlet UILabel *filmDate;
@property (readwrite) IBOutlet UITextView *filmDescription;
@property (nonatomic, retain) IBOutlet BButton *btnPhimList;
@property (nonatomic, retain) IBOutlet BButton *btnAbout;

@end
