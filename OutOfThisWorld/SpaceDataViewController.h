//
//  SpaceDataViewController.h
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/19/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceObject.h"

@interface SpaceDataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SpaceObject *spaceObject;
@end
