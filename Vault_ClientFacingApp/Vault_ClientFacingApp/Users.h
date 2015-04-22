//
//  Users.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/16/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject

-(instancetype)initWithDictionary:(NSDictionary *)userFromServerDict;

@end
