//
//  CustomColors.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/20/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) \
                [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                alpha:1.0]

#define PINK_HEX        0xfb266c
#define GREEN_HEX       0xa8e62e
#define BLUE_HEX        0x60d5f0
#define GREY_HEX        0x8f908a
#define DARK_GREY_HEX   0x333333
#define WHITE_HEX       0xeef8fa

@interface CustomColors : NSObject


@end
