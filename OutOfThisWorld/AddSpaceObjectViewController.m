//
//  AddSpaceObjectViewController.m
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/22/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "AddSpaceObjectViewController.h"
#import "OutterSpaceTableViewController.h"

@interface AddSpaceObjectViewController ()

@end

@implementation AddSpaceObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *defaultBackgroundImage = [UIImage imageNamed:@"Orion.jpg"];

    self.view.backgroundColor = [UIColor colorWithPatternImage:defaultBackgroundImage];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCancel:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)btnAdd:(UIButton *)sender {

    SpaceObject *newSpaceObject = [self returnSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}

-(SpaceObject *)returnSpaceObject{
    SpaceObject *spaceObject = [SpaceObject new];

    spaceObject.name = self.txtName.text;
    spaceObject.nickName = self.txtNickname.text;
    spaceObject.diameter = [self.txtDiameter.text floatValue];
    spaceObject.temp = [self.txtTemp.text floatValue];
    spaceObject.numberOfMoons = [self.txtMoons.text intValue];
    spaceObject.interstingFact = self.txtFact.text;

    return spaceObject;
}
@end
