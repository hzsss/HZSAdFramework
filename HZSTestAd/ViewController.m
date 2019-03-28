//
//  ViewController.m
//  HZSTestAd
//
//  Created by Acan on 2019/3/28.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
#import <HZSAdFramework/HZSAdFramework.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[HZSAdManager sharedManager] setupInterstitialWithUnitId:@"ca-app-pub-3940256099942544/4411468910"];
}

- (IBAction)btnClick:(id)sender {
    [[HZSAdManager sharedManager] presentFromRootViewController:self];
}

@end
