//
//  ViewController.m
//  OrbitAnimationView
//
//  Created by YU CHONKAO on 2016/3/12.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "ViewController.h"
#import "OrbitAnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) OrbitAnimationView *orbitAnimationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _orbitAnimationView = [[OrbitAnimationView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.orbitAnimationView setCenter:self.view.center];
    [self.orbitAnimationView setShapeColor:[UIColor redColor]];
    [self.view addSubview:self.orbitAnimationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
