//
//  AddSpaceObjectViewController.h
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/22/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceObject.h"

@protocol AddSpaceObjectViewControllerDeleagte <NSObject>

@required
-(void)addSpaceObject:(SpaceObject *)spaceObject;
-(void)didCancel;
@end

@interface AddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <AddSpaceObjectViewControllerDeleagte> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtNickname;
@property (strong, nonatomic) IBOutlet UITextField *txtDiameter;
@property (strong, nonatomic) IBOutlet UITextField *txtTemp;
@property (strong, nonatomic) IBOutlet UITextField *txtMoons;
@property (strong, nonatomic) IBOutlet UITextField *txtFact;

- (IBAction)btnCancel:(UIButton *)sender;
- (IBAction)btnAdd:(UIButton *)sender;
@end
