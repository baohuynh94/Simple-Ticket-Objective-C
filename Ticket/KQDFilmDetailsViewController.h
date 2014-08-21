//
//  KQDFilmDetailsViewController.h
//  Ticket
//
//  Created by Dino Phan on 20/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KQFileManager.h"
#import "KQDBManager.h"
#import "BButton.h"

@interface KQDFilmDetailsViewController : UIViewController {
    int idPhim;
    NSString *tenPhim;
    NSString *anhBia;
    NSString *theLoai;
    NSString *noiDung;
    NSString *doDai;
    NSString *codePhim;
}

@property (nonatomic) int idPhim;
@property (nonatomic, retain) NSString *tenPhim;
@property (nonatomic, retain) NSString *anhBia;
@property (nonatomic, retain) NSString *theLoai;
@property (nonatomic, retain) NSString *noiDung;
@property (nonatomic, retain) NSString *doDai;
@property (nonatomic, retain) NSString *codePhim;

@property (nonatomic, retain) IBOutlet UIImageView *obAnhBia;
@property (nonatomic, retain) IBOutlet UILabel *obThoiLuong;
@property (nonatomic, retain) IBOutlet UILabel *obTheLoai;
@property (nonatomic, retain) IBOutlet UITextView *obNoiDung;
@property (nonatomic, retain) IBOutlet UILabel *tieuDe;

// button
@property (nonatomic, retain) IBOutlet BButton *btnBack;
@property (nonatomic, retain) IBOutlet BButton *btnOrder;

@end
