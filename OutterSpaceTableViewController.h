//
//  OutterSpaceTableViewController.h
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/9/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceObject.h"

@interface OutterSpaceTableViewController : UITableViewController
@property (strong, nonatomic) SpaceObject *spaceObject;
@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;
@end
