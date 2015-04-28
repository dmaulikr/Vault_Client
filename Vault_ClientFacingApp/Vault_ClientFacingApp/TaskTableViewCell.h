//
//  TaskTableViewCell.h
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/22/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel
;
@property (weak, nonatomic) IBOutlet UILabel *epicTag;

@end
