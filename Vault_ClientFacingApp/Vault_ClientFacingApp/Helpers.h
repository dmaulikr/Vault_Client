//
//  Helpers.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/17/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helpers : NSObject

+(BOOL)handleServerErrors:(NSURLResponse *)response;
+(UIImage *)getProfilePicFromDefault;
+(void)setProfilePicFromDefault:(UIImage *)image;

@end
