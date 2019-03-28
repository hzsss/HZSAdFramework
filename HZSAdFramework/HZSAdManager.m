//
//  HZSAdManager.m
//  HZSAdFramework
//
//  Created by Acan on 2019/3/28.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "HZSAdManager.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <VungleSDK/VungleSDK.h>

@interface HZSAdManager()<GADInterstitialDelegate, VungleSDKDelegate>

@property (nonatomic, strong) GADInterstitial *interstitial;
@property (nonatomic, copy) NSString *unitId;

@end

@implementation HZSAdManager

+ (instancetype)sharedManager {
    static HZSAdManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (void)startSDKWithAppId:(NSString *)appId {
//    if (!appId && appId.length == 0) return;
    
    switch (self.adType) {
        case HZSAdTypeAdmob: {
            // TODO：这里需要动态地修改 plist 文件（不需要了）
            [GADMobileAds.sharedInstance startWithCompletionHandler:nil];
        }
            break;
            
        case HZSAdTypeVungle:
            [[VungleSDK sharedSDK] startWithAppId:appId error:nil];
            break;
            
        case HZSAdTypeYeahMobi:
            
            break;
        
        case HZSAdTypeMobvista:
            
            break;
        
        case HZSAdTypeAdtiming:
            
            break;
    }
}

// 加载插页式广告
- (void)setupInterstitialWithUnitId:(NSString *)unitId {
    if (!unitId && unitId.length == 0) return;
    self.unitId = unitId;
    
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:unitId];
    self.interstitial.delegate = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID, @"58A00AF6-8D34-4CFA-87BC-4A6EE10ACCD4"];
    [self.interstitial loadRequest:request];
}

// 页面即将消失时重新创建 interstital
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    if (!self.unitId && self.unitId.length == 0) return;
    
    [self setupInterstitialWithUnitId:self.unitId];
}

// 弹出插页式广告
- (void)presentFromRootViewController:(UIViewController *)controller {
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:controller];
    } else {
        NSLog(@"广告还未准备好");
    }
}

// 加载 vungle 广告
- (void)loadPlacementWithID:(NSString *)placementID error:(NSError *)error {
    if (!placementID && placementID.length == 0) return;
    [[VungleSDK sharedSDK] loadPlacementWithID:placementID error:&error];
}

@end
