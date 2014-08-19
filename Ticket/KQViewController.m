//
//  KQViewController.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQViewController.h"
#import "KQIncommingFilmViewController.h"
#import "KQAboutViewController.h"

@interface KQViewController ()

@end

@implementation KQViewController
@synthesize tab, btnPhimList, btnAbout;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Settings
    float timerInterval = 6.0;
    
    
    // Connect to the Database with name dulieuphim.sqlite
    NSString *databaseFile = @"dulieuphim.sqlite";
    NSString *databaseFullPath = [[NSString alloc] initWithString:[[KQFileManager getSharedInstance] getFullPathInDocumentForFile:databaseFile]];
    [[KQDBManager getSharedInstance] connectDatabaseWithName:databaseFullPath];
    
    
    // Load new film from dulieuphim.sqlite to NSArray
    tenPhim = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"TenPhim"]];
    anhBia = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"AnhBia"]];
    theLoai = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"TheLoai"]];
    noiDung = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"NoiDung"]];
    doDai = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"DoDai"]];
    ngayChieu = [[NSMutableArray alloc] initWithArray:[[KQDBManager getSharedInstance] getDataFromTable:@"PhimMoi" withColumn:@"NgayChieu"]];
    
    // Erase statement and close database
    [[KQDBManager getSharedInstance] disconnectDatabase];
    
    // Set scrollView for new film
    float scrollViewWidth = _scrollNewFilm.frame.size.width;
    int numberOfFilms = [tenPhim count];
    float contentSizeWidth = scrollViewWidth * numberOfFilms;
    
    // Set button for new TableView
    [btnPhimList setTitle:@"Đặt Vé" forState:UIControlStateNormal];
    [btnPhimList setColor:[UIColor orangeColor]];
    [btnPhimList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAbout setTitle:@"Thông Tin" forState:UIControlStateNormal];
    [btnAbout setColor:[UIColor grayColor]];
    [btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    [_scrollNewFilm setContentSize:CGSizeMake(contentSizeWidth, 240)];
    _scrollNewFilm.pagingEnabled = YES;
    _scrollNewFilm.bounces = NO;
    _scrollNewFilm.showsHorizontalScrollIndicator = NO;
    _scrollNewFilm.showsVerticalScrollIndicator = NO;
    
    for (int count = 0; count < numberOfFilms; count++) {
        UIImageView *imageNewFilm = [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth * count, 0, 320, 240)];
        NSString *coverFullPath = [[NSString alloc] init];
        coverFullPath = [[KQFileManager getSharedInstance] getFullPathInDocumentForFile:[anhBia objectAtIndex:count]];
        [imageNewFilm setImage:[UIImage imageWithContentsOfFile:coverFullPath]];
        
        // Create the colors
        UIColor *darkOp = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8];
        UIColor *lightOp = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.colors = [NSArray arrayWithObjects:(id)lightOp.CGColor, (id)darkOp.CGColor, nil];
        gradient.frame = imageNewFilm.bounds;
        [imageNewFilm.layer insertSublayer:gradient atIndex:0];
        
        UILabel *filmName = [[UILabel alloc] initWithFrame:CGRectMake(imageNewFilm.frame.origin.x + 25, imageNewFilm.frame.size.height - 50, 310, 25)];
        [filmName setFont:[UIFont fontWithName:@"AmericanTypewriter-Condensed" size:20.0]];
        [filmName setTextColor:[UIColor whiteColor]];
        [filmName setText:[tenPhim objectAtIndex:count]];
        
        UILabel *filmCaterogy = [[UILabel alloc] initWithFrame:CGRectMake(filmName.frame.origin.x + 10, filmName.frame.origin.y + filmName.frame.size.height, 290, 18)];
        [filmCaterogy setFont:[UIFont fontWithName:@"American Typewriter" size:16.0]];
        [filmCaterogy setTextColor:[UIColor whiteColor]];
        [filmCaterogy setText:[theLoai objectAtIndex:count]];
        
        [_scrollNewFilm addSubview:imageNewFilm];
        [_scrollNewFilm addSubview:filmName];
        [_scrollNewFilm addSubview:filmCaterogy];
        _scrollNewFilm.delegate = self;
        
        // Set data for descrition
        [self scrollViewDidEndDecelerating:_scrollNewFilm];
        
        // Start timer
        [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(startScrollNewFilm) userInfo:nil repeats:YES];
    }
}

- (void)startScrollNewFilm {
    int page = _scrollNewFilm.contentOffset.x / _scrollNewFilm.frame.size.width;
    int numberOfImages = [tenPhim count];
    
    if (page != (numberOfImages - 1)) {
        [_scrollNewFilm setContentOffset:CGPointMake(320 * (page + 1), 0) animated:YES];
    } else {
        [_scrollNewFilm setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = _scrollNewFilm.contentOffset.x / _scrollNewFilm.frame.size.width;
    [_filmDate setText:[ngayChieu objectAtIndex:page]];
    [_filmLength setText:[doDai objectAtIndex:page]];
    [_filmDescription setText:[noiDung objectAtIndex:page]];
    [_filmDescription setTextColor:[UIColor whiteColor]];
    [_filmDescription setFont:[UIFont fontWithName:@"American Typewriter" size:13.0]];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    int page = _scrollNewFilm.contentOffset.x / _scrollNewFilm.frame.size.width;
    [_filmDate setText:[ngayChieu objectAtIndex:page]];
    [_filmLength setText:[doDai objectAtIndex:page]];
    [_filmDescription setText:[noiDung objectAtIndex:page]];
    [_filmDescription setTextColor:[UIColor whiteColor]];
    [_filmDescription setFont:[UIFont fontWithName:@"American Typewriter" size:13.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
