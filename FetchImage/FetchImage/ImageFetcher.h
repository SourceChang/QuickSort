//
//  ImageFetcher.h
//  FetchImage
//
//  Created by Source on 2020/9/30.
//  Copyright © 2020 Source. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


// 错误域
FOUNDATION_EXPORT NSString * _Nonnull const ImageFetcherErrorDomain;


// 错误码
typedef NS_ENUM( NSInteger, ImageFetcherErrorCode ) {
    
    ImageFetcherErrorCodeCanNotGetImageData = 1,    // 无法获取图片文件内容
    ImageFetcherErrorCodeCanNotGetImage     = 2,    // 无法获取图片
    ImageFetcherErrorCodeUnknown            = 0xFF, // 未知错误
    
};


/// 图片加载类
@interface ImageFetcher : NSObject


/// 从指定路径加载出图片并解码
/// @param strFilePath 图片文件路径
/// @param completion 结束回调
- (void)fetchImageWithFilePath:(nonnull NSString *)strFilePath
                    completion:(nonnull void (^)(UIImage * _Nullable image, NSError * _Nullable error))completion;


@end


NS_ASSUME_NONNULL_END

