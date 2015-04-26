//
//  SpaceDataViewController.m
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/19/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "SpaceDataViewController.h"

@interface SpaceDataViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SpaceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *dataString = @"DataCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dataString
                                                            forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname:";
            cell.detailTextLabel.text = self.spaceObject.nickName;
            break;

        case 1:
            cell.textLabel.text =@"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", self.spaceObject.diameter];
            break;

        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.spaceObject.gravitationalForce];
            break;

        case 3:
            cell.textLabel.text = @"Year Length(Days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.spaceObject.yearLength];
            break;

        case 4:
            cell.textLabel.text = @"Day Length(Hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", self.spaceObject.dayLength];
            break;

        case 5:
            cell.textLabel.text = @"Temp (Celsius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", self.spaceObject.temp];
            break;

        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.spaceObject.numberOfMoons];
            break;

        case 7:
            cell.textLabel.text = @"Interesting Fact:";
            cell.detailTextLabel.text = self.spaceObject.interstingFact;
            break;

        default:
            break;
    }

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}


/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
