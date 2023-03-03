//
//  NetworkManager.h
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import <Foundation/Foundation.h>
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject <NSURLConnectionDelegate> {
    NSMutableData * _responseData;
}

- (void)getDataFromURL: (NSString *)urlStr reqType: (NSString *)reqType headers: (NSDictionary *)headers completionHandler:(void (^)(Movie * data, NSError * error))completionHandler;
@end

NS_ASSUME_NONNULL_END
