//
//  LogTableViewCell.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/22/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *nameOrComplete;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *awardedToFrom;

@end
