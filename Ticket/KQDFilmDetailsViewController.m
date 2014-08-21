//
//  KQDFilmDetailsViewController.m
//  Ticket
//
//  Created by Dino Phan on 20/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQDFilmDetailsViewController.h"

@interface KQDFilmDetailsViewController ()

@end

@implementation KQDFilmDetailsViewController
@synthesize idPhim, theLoai, tenPhim, noiDung, doDai, codePhim, anhBia, obAnhBia, obNoiDung, obTheLoai, obThoiLuong;

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
    
    // Custom btn
    [_btnBack setTitle:@"Trở về" forState:UIControlStateNormal];
    [_btnBack setColor:[UIColor orangeColor]];
    [_btnOrder setTitle:@"Đặt vé" forState:UIControlStateNormal];
    [_btnOrder setColor:[UIColor redColor]];
    [self setTitle:tenPhim];
    
    // Navigation
    
    [obAnhBia setImage:[UIImage imageWithContentsOfFile:[[KQFileManager getSharedInstance] getFullPathInDocumentForFile:anhBia]]];
    [obThoiLuong setText:doDai];
    [obTheLoai setText:theLoai];
    [obNoiDung setText:noiDung];
    [obNoiDung setTextColor:[UIColor whiteColor]];
    [obNoiDung setFont:[UIFont fontWithName:@"American Typewriter" size:13.0]];
    [_tieuDe setText:tenPhim];
    
    // Gradient layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = obAnhBia.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0] CGColor], (id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9] CGColor], nil];
    [obAnhBia.layer addSublayer:gradient];
    
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
