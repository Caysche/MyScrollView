//
//  ViewController.m
//  MyScrollView
//
//  Created by Cay Cornelius on 19/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic, strong) MyScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *initialView = [[UIView alloc] init];
    [self.view addSubview:initialView];
    initialView.frame = self.view.bounds;
    
    self.myScrollView = [[MyScrollView alloc] init];
    [initialView addSubview:self.myScrollView];
    self.myScrollView.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scroll:)];
    [initialView addGestureRecognizer:self.myScrollView.panGestureRecognizer];
    
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:redView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.myScrollView addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.myScrollView addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.myScrollView addSubview:yellowView];
}

-(void)viewDidAppear:(BOOL)animated {
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 100;
    self.view.bounds = bounds;
    
    self.myScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 800.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scroll:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    CGRect bounds = self.view.bounds;
    
    
    // Translate the view's bounds, but do not permit values that would violate contentSize
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.myScrollView.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.myScrollView.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.view.bounds = bounds;
    [recognizer setTranslation:CGPointZero inView:self.view];
}

@end
