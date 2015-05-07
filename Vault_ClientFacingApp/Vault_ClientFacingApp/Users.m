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
        _username = [NSString new];
    }
    return self;
}

+(id)sharedUser
{
    static id mySharedUser = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        mySharedUser = [[self alloc] init];
    });
    return mySharedUser;
}

@end
