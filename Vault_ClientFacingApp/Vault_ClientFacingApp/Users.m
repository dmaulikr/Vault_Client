//
//  Users.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/16/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "Users.h"

@implementation Users

-(instancetype)init
{
    if (self = [super init]) {
        
        _firstname = [NSString new];
        _username = [NSString new];
        _authToken = [NSString new];
        _email = [NSString new];
        _currentProject = [NSString new];
        _devClass = [NSString new];
        
        _currentMainLv = 1;
        _currentMainSubLv = 0;
        _currentLeftLv = 0;
        _currentLeftSubLv = 0;
        _currentRightLv = 0;
        _currentRightSubLv = 0;
        _currentEXP = 0;
        _expToNextLevel = 1000;
    }
    return self;
}

+(id)currentUser
{
    static id myCurrentUser = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        myCurrentUser = [[self alloc] init];
    });
    return myCurrentUser;
}

@end
