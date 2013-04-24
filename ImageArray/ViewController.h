//
//  ViewController.h
//  ImageArray
//
//  Created by Stronger Shen on 13/4/18.
//  Copyright (c) 2013年 MobileIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray *imagesArray;

- (IBAction)btnLoadImage:(id)sender;
- (IBAction)btnLoadImageFromBundle:(id)sender;

@end
