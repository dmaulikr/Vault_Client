//
//  Users.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/16/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Users : NSObject

@property NSString *firstname;
@property NSString *username;
@property NSString *authToken;
@property NSString *email;
@property NSString *currentProject;
@property NSString *devClass;

@property int currentMainLv;
@property int currentMainSubLv;
@property int currentLeftLv;
@property int currentLeftSubLv;
@property int currentRightLv;
@property int currentRightSubLv;
@property int currentEXP;
@property int expToNextLevel;

+(id)sharedUser;

@end
