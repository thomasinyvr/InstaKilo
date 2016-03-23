//
//  MyCollectionViewCell.m
//  InstaKilo
//
//  Created by Thomas Friesman on 2016-03-23.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iMAGE;

@end

@implementation MyCollectionViewCell

-(void)setObject:(Photo *)object
{
    _object = object;
    [self setUp];
}

-(void)setUp
{
    self.iMAGE.image = self.object.image;
}


@end
