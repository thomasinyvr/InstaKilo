//
//  Photo.m
//  InstaKilo
//
//  Created by Thomas Friesman on 2016-03-23.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (NSArray *)photoArray
{
    Photo *pic1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image1"] subject:@"Europe" andLocation:@"Prague"];
    Photo *pic2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image2"] subject:@"Europe" andLocation:@"Budapest"];
    Photo *pic3 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image3"] subject:@"Europe" andLocation:@"Danube"];
    Photo *pic4 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image4"] subject:@"Europe" andLocation:@"Oia"];
    Photo *pic5 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image5"] subject:@"Europe" andLocation:@"Santorini"];
    Photo *pic6 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image6"] subject:@"China" andLocation:@"Santorini"];
    Photo *pic7 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image7"] subject:@"China" andLocation:@"Lijiang"];
    Photo *pic8 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image8"] subject:@"China" andLocation:@"Lijiang"];
    Photo *pic9 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image9"] subject:@"China" andLocation:@"Yulong"];
    Photo *pic10 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Image10"] subject:@"China" andLocation:@"Shangri-La"];
    
    return @[pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic9, pic10];

    
}

-(instancetype)initWithImage:(UIImage *)image subject:(NSString *)subject andLocation:(NSString *)location
{
    self = [super init];
    if (self) {
        _image = image;
        _subject = subject;
        _location = location;
        
    }
    
    return self;
}

@end
