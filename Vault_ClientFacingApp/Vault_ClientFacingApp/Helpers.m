//
//  Helpers.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/17/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers

+ (BOOL)handleServerErrors:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    NSLog(@"CODE: %ld", (long)responseStatusCode);
    NSLog(@"%@", httpResponse);
        
    BOOL login = false;
    
    if (responseStatusCode == 200)
    {
        login = TRUE;
    }
    
    return login;
}

+(NSString *)getAuthToken:(NSURLResponse *)response
{
    NSString *authToken;
    return authToken;
}

+(UIImage *)getProfilePicFromDefault
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = [defaults dataForKey:@"profilePic"];
    UIImage *profilePic = [UIImage imageWithData:imageData];
    
    return profilePic;
}

+(void)setProfilePicFromDefault:(UIImage *)image;
{
    NSData *savedProfilePicture = UIImageJPEGRepresentation(image, 10);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savedProfilePicture forKey:@"profilePic"];
    [defaults synchronize];
}

@end
