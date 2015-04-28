//
//  HubAchievementTableViewCell.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/27/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HubAchievementTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *achievemenatName;
@property (weak, nonatomic) IBOutlet UILabel *achievementDate;
@property (weak, nonatomic) IBOutlet UILabel *achievementReason;

@end
