//
//  Photo.h
//  InstaKilo
//
//  Created by Thomas Friesman on 2016-03-23.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic) NSString *location;
@property (nonatomic) NSString *subject;
@property (nonatomic) UIImage *image;

+ (NSArray *)photoArray;

-(instancetype)initWithImage:(UIImage*)image subject:(NSString*)subject andLocation:(NSString *)location;

@end
