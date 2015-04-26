//
//  SpaceImageViewController.m
//  OutOfThisWorld
//
//  Created by Albert Saucedo on 4/15/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "SpaceImageViewController.h"

@interface SpaceImageViewController () 

@end

@implementation SpaceImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.delegate = self;

    self.imageView = [[UIImageView alloc] initWithImage: self.spaceObject.spaceImage];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];

    self.scrollView.maximumZoomScale = 10.0;
    self.scrollView.minimumZoomScale = 0.5;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
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
