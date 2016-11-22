//
//  ViewController.m
//  One
//
//  Created by youngstar on 16/3/1.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"
#import "WSCoachMarksView.h"

@interface ViewController () <WSCoachMarksViewDelegate>
@property (nonatomic, strong) WSCoachMarksView *coachMarksView;
@property (nonatomic, strong) UIImageView *imageZoneView ;
@property (nonatomic, strong) UIImageView *imageOneView ;
@property (nonatomic, strong) UIImageView *imageTwoView ;
@property (nonatomic, strong) UIImageView *imageThrView ;
@property (nonatomic, strong) UIImageView *imageFourView ;
@property (nonatomic, strong) UIImageView *imageFiveView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:@"1" forKey:@"reminder"];
    
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(60, 60, 40, 30))];
    label.backgroundColor = [UIColor redColor];
    label.text = @"签到";
    [self.view addSubview:label];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:(CGRectMake(60, 260, 40, 30))];
    label2.backgroundColor = [UIColor redColor];
    label2.text = @"补签";
    [self.view addSubview:label2];
    
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{0,0},{45,45}}],
                                @"caption": @"Helpful navigation menu"
//                                @"shape": @"circle"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{60.0f,60.0f},{40.0f,30.0f}}],
                                @"caption": @"Document your wedding by taking photos"
//                                @"shape": @"square"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,119.0f},{300.0f,56.0f}}],
                                @"caption": @"Your wedding photo album"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,182.0f},{300.0f,56.0f}}],
                                @"caption": @"View and manage your friends & family"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,245.0f},{300.0f,56.0f}}],
                                @"caption": @"Invite friends to get more photos"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{0.0f,410.0f},{320.0f,50.0f}}],
                                @"caption": @"Keep your guests informed with your wedding details"
                                }
                            ];
    self.coachMarksView = [[WSCoachMarksView alloc] initWithFrame:self.view.bounds coachMarks:coachMarks];
    _coachMarksView.delegate = self;
    _coachMarksView.maskColor = [UIColor colorWithWhite:0.9f alpha:0.9];
    [self.view addSubview:_coachMarksView];
    
//    [_coachMarksView start];
    
}

// 只会出现一次
- (void)viewDidAppear:(BOOL)animated {
    // Show coach marks
    BOOL coachMarksShown = [[NSUserDefaults standardUserDefaults] boolForKey:@"WSCoachMarksShown"];
    if (coachMarksShown == NO) {
        // Don't show again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"WSCoachMarksShown"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        // Show coach marks
        [_coachMarksView start];
        
        // Or show coach marks after a second delay
        // [coachMarksView performSelector:@selector(start) withObject:nil afterDelay:1.0f];
    }
}

- (void)coachMarksView:(WSCoachMarksView*)coachMarksView willNavigateToIndex:(NSUInteger)index
{
  
    if (index == 0) {
        NSLog(@"index:%lu", (unsigned long)index);
        self.imageZoneView = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 50, 50, 30))];
        _imageZoneView.image = [UIImage imageNamed:@"activity_hot.png"];
        [self.coachMarksView addSubview:_imageZoneView];
        
    }
    if (index == 1) {
       NSLog(@"index:%lu", (unsigned long)index);
        [_imageZoneView removeFromSuperview];
       self.imageOneView = [[UIImageView alloc]initWithFrame:(CGRectMake(40, 600, 50, 30))];
        _imageOneView.image = [UIImage imageNamed:@"monkey.png"];
        coachMarksView.userInteractionEnabled = YES;
        [self.coachMarksView addSubview:_imageOneView];
       
    }
    if (index == 2) {
        NSLog(@"index:%lu", (unsigned long)index);
        [_imageOneView removeFromSuperview];
        self.imageTwoView = [[UIImageView alloc]initWithFrame:(CGRectMake(50, 200, 50, 30))];
        _imageTwoView.image = [UIImage imageNamed:@"activity_finish.png"];
        coachMarksView.userInteractionEnabled = YES;
        [self.coachMarksView addSubview:_imageTwoView];
        
    }
    if (index == 3) {
        NSLog(@"index:%lu", (unsigned long)index);
        [_imageTwoView removeFromSuperview];
        self.imageThrView = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 300, 50, 30))];
        _imageThrView.image = [UIImage imageNamed:@"activity_hot.png"];
        coachMarksView.userInteractionEnabled = YES;
        [self.coachMarksView addSubview:_imageThrView];
    }
    if (index == 4) {
        NSLog(@"index:%lu", (unsigned long)index);
        [_imageThrView removeFromSuperview];
        self.imageFourView = [[UIImageView alloc]initWithFrame:(CGRectMake(30, 400, 50, 30))];
        _imageFourView.image = [UIImage imageNamed:@"monkey.png"];
        coachMarksView.userInteractionEnabled = YES;
        [self.coachMarksView addSubview:_imageFourView];
    }
    if (index == 5) {
        NSLog(@"index:%lu", (unsigned long)index);
        [_imageFourView removeFromSuperview];
        self.imageFiveView = [[UIImageView alloc]initWithFrame:(CGRectMake(30, 200, 50, 30))];
        _imageFiveView.image = [UIImage imageNamed:@"activity_hot.png"];
        [self.coachMarksView addSubview:_imageFiveView];
    }
}
- (void)coachMarksView:(WSCoachMarksView*)coachMarksView didNavigateToIndex:(NSUInteger)index
{
    if (index == 5) {
        NSLog(@"AAAAAAAA");
    }
}
- (void)coachMarksViewWillCleanup:(WSCoachMarksView*)coachMarksView
{
    NSLog(@"3333333333");
     [_imageFiveView removeFromSuperview];
}
- (void)coachMarksViewDidCleanup:(WSCoachMarksView*)coachMarksView
{
    NSLog(@"4444444444");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
