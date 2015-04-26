//
//  SpaceObject.h
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *interstingFact;

@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temp;

@property (nonatomic) int numberOfMoons;

@property (strong, nonatomic) UIImage *spaceImage;



-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;
@end
