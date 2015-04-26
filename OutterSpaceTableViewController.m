//
//  OutterSpaceTableViewController.m
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/9/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "OutterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "SpaceObject.h"
#import "SpaceImageViewController.h"
#import "SpaceDataViewController.h"
#import "AddSpaceObjectViewController.h"

@interface OutterSpaceTableViewController ()<AddSpaceObjectViewControllerDeleagte>

@end

@implementation OutterSpaceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.planets = [NSMutableArray new];


    // access the array of mutable dictionaries
    for (NSMutableDictionary *data in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", data[PLANET_NAME]];
        SpaceObject *planet  = [[SpaceObject alloc] initWithData:data
                                                        andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }

    /*
     NSMutableDictionary *leDictionary = [NSMutableDictionary new];

     // Key must be unique
     [leDictionary setObject:@"Blue" forKey:@"Water color"];
     [leDictionary setObject:@"Blue" forKey:@"Sky Color"];
     [leDictionary setObject:@"Red" forKey:@"FireTruck"];

     NSString *redString = [leDictionary objectForKey:@"FireTruck"];

     NSLog(@"%@", leDictionary);
     NSLog(@"%@", redString);
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", sender);

    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[SpaceImageViewController class]]) {

            SpaceImageViewController *spaceImageVCNext = segue.destinationViewController;

            //Give me the index path of the tableview cell thats being sent
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            NSLog(@"%ld", (long)indexPath.row);

            //Give me the name or any other property of the space object for which row index I selected
            SpaceObject *selectedSpaceObject;

            if (indexPath.section == 0) {
                selectedSpaceObject = self.planets[indexPath.row];
            } else if (indexPath.section == 1) {
                selectedSpaceObject = self.addedSpaceObjects[indexPath.row];
            }

            spaceImageVCNext.spaceObject = selectedSpaceObject;
        }
    }

    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[SpaceDataViewController class]]) {
            SpaceDataViewController *spaceInfoVC = segue.destinationViewController;
            NSIndexPath *indexPath = sender;
            SpaceObject *spaceObject;

            if (indexPath.section == 0) {
                spaceObject = self.planets[indexPath.row];
            } else if (indexPath.section == 1) {
                spaceObject = self.addedSpaceObjects[indexPath.row];
            }

            spaceInfoVC.spaceObject = spaceObject;
        }
    }

    if ([segue.destinationViewController isKindOfClass:[AddSpaceObjectViewController class]]) {
        AddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.

    if ([self.addedSpaceObjects count]) {
        return 2;
    } else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.


    if (section == 1) {
        return [self.addedSpaceObjects count];;
    } else {
        return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];

    SpaceObject *spaceOject = [self.planets objectAtIndex:indexPath.row];

    // Configure the cell...

    if (indexPath.section == 1) {

        //Use new space object to custy our cell

        SpaceObject *newPlanet = [self.addedSpaceObjects objectAtIndex:indexPath.row];

        cell.textLabel.text = newPlanet.name;
        cell.detailTextLabel.text = newPlanet.nickName;

    } else {

        cell.textLabel.text = spaceOject.name;
        cell.detailTextLabel.text = spaceOject.nickName;
        cell.imageView.image = spaceOject.spaceImage;

    }

    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:.7 alpha:1];

    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor blackColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }

    return cell;
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"SpaceObjectInfo" sender:indexPath];
}

#pragma mark AddObjectVC Delegate

-(void)addSpaceObject:(SpaceObject *)spaceObject{

    //Lazy Instanciation?
    //If the array doesn't exist instanciate it

    if (!self.addedSpaceObjects) {
        self.addedSpaceObjects = [NSMutableArray new];
    }
    [self.addedSpaceObjects addObject:spaceObject];

    [self.tableView reloadData];

    NSLog(@"Add Space Object");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancel{
    NSLog(@"Did Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
