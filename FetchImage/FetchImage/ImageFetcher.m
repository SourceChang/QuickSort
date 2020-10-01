//
//  ImageFetcher.m
//  FetchImage
//
//  Created by Source on 2020/9/30.
//  Copyright © 2020 Source. All rights reserved.
//

#import "ImageFetcher.h"


NSString * _Nonnull const ImageFetcherErrorDomain = @"ImageFetcherErrorDomain";


@interface ImageFetcher ()


/// 异步队列
@property (nonatomic, strong, nonnull) dispatch_queue_t queue;


@end


@implementation ImageFetcher


/**
 1, 回调的问题，回调都是在子线程
 2. 参数校验的问题，一开始就需要校验了
 3, 图片返回的 scale
 4, 不支持取消
 */


#pragma mark - Life Circle
- (nonnull instancetype)init {
    
    self = [super init];
    if ( self ) {
        
        _queue = dispatch_queue_create("com.zym", DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}


#pragma mark - Public Methods
- (void)fetchImageWithFilePath:(nonnull NSString *)strFilePath
                    completion:(nonnull void (^)(UIImage * _Nullable image, NSError * _Nullable error))completion {
    
    __weak __typeof(self) weakSelf = self;
    dispatch_async( self.queue, ^ {
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        if ( !strongSelf ) {
            
            return;
        }
        
        NSData *imageData = [NSData dataWithContentsOfFile:strFilePath];
        if ( !imageData ) {
            
            if ( completion ) {
                
                NSError *error = [self createErrorWithCode:ImageFetcherErrorCodeCanNotGetImageData
                                       localizedDescriptio:@"Can not get image data"];
                completion( nil, error );
            }
            
            return;
        }
        
        UIImage *image = [UIImage imageWithData:imageData];
        if ( !image ) {
            
            if ( completion ) {
                
                NSError *error = [self createErrorWithCode:ImageFetcherErrorCodeCanNotGetImage
                                       localizedDescriptio:@"Can not get image"];
                completion( nil, error );
            }
            
            return;
        }
        
        UIImage *decodedImage = [strongSelf createDecodedImageWithOriginal:image];
        if ( completion ) {
            
            completion( decodedImage, nil );
        }
    } );
}


#pragma mark - Private Methods
/// 获取解码之后的图片
/// @param image 原始图片
- (nonnull UIImage *)createDecodedImageWithOriginal:(nonnull UIImage *)image {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    UIImage *decodedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return decodedImage;
}



/// 创建错误对象
/// @param code 指定的错误码枚举
/// @param strLocalizedDescriptio 错误对象多语言描述
- (nonnull NSError *)createErrorWithCode:(ImageFetcherErrorCode)code
                     localizedDescriptio:(nonnull NSString *)strLocalizedDescriptio {
    
    NSError *error = [NSError errorWithDomain:@"ImageFetcherErrorDomain"
                                         code:code
                                     userInfo:@{ NSLocalizedDescriptionKey : strLocalizedDescriptio }];
    
    return error;
}


@end
