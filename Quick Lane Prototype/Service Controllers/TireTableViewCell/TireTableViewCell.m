//
//  TireTableViewCell.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "TireTableViewCell.h"

@implementation TireTableViewCell

@synthesize imageView;

- (id) init {
    self = [super init];
    if (self) {
        [imageView setFrame:CGRectMake(0, 0, 280, 140)];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
