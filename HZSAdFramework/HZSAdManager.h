//
//  HZSAdManager.h
//  HZSAdFramework
//
//  Created by Acan on 2019/3/28.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZSAdManager : NSObject

typedef enum HZSAdType: NSInteger { // 不能这样设计，这样的话意味着用户只能选择一种广告，没有办法在同一个 App 中加载多个开发商的广告
    HZSAdTypeAdmob,
    HZSAdTypeVungle,
    HZSAdTypeYeahMobi,
    HZSAdTypeMobvista,
    HZSAdTypeAdtiming
} HZSAdType;

@property (nonatomic, assign) HZSAdType adType; // 广告类型

+ (instancetype)sharedManager;
- (void)startSDKWithAppId:(NSString *)appId;
- (void)setupInterstitialWithUnitId:(NSString *)unitId;
- (void)presentFromRootViewController:(UIViewController *)controller;
- (void)loadPlacementWithID:(NSString *)placementID error:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
