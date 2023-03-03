//
//  NetworkManager.m
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import "NetworkManager.h"

@implementation NetworkManager

//singleton
- (instancetype)init {
    
    self = [super init];
    return self;
}

- (void)getDataFromURL: (NSString *)urlStr reqType: (NSString *)reqType headers: (NSDictionary *)headers completionHandler:(void (^)(Movie * data, NSError * error))completionHandler{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [request setHTTPMethod:reqType];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        Movie *movie;
        if (error != nil) {
            NSLog(@"Error: %@", error);
            completionHandler(nil, error);
            return;
        }
        NSArray *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        movie = (Movie *)responseDict;
        
        completionHandler(movie, nil);
    }];
    [dataTask resume];
    
}

@end
