//
//  ViewController.m
//  ImageArray
//
//  Created by Stronger Shen on 13/4/18.
//  Copyright (c) 2013年 MobileIT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoadImage:(id)sender {
    NSError *error;
    
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];

    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:0];
    NSLog(@"documentsDirectory:%@\ndirectoryContent.count:%d\ndirectoryContent:%@",
          documentsDirectory,
          directoryContent.count,
          directoryContent);

    for(int i=0;i<directoryContent.count;i++){
        NSString *imagePath= [documentsDirectory stringByAppendingPathComponent:
                           [directoryContent objectAtIndex:i] ]  ;
//        UIImage *img=[UIImage imageNamed: imagePath];
        // 從路徑取得的，要以 imageWithContentsOfFile 載入
        UIImage *img=[UIImage imageWithContentsOfFile: imagePath];
        
        imageView.image = img;
        NSLog(@"image filename: %@", imagePath);
        [items addObject:img];
    }
    NSLog(@"imagesArray:%@", items);    
}


- (IBAction)btnLoadImageFromBundle:(id)sender {
    NSArray *directoryContent = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil];
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:0];
    
    /*
    for (int i=0; i<([directoryContent count]); i++) {
        NSString *imagePath = [directoryContent objectAtIndex:i];
        NSLog(@"image filename: %@", imagePath);

//        UIImage *img=[UIImage imageNamed: imagePath];
        // 從路徑取得的，要以 imageWithContentsOfFile 載入
        UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
        imageView.image = img;
        [items addObject:img];
    }
    NSLog(@"imagesArray:%@", items);
     */
    
    for (NSString *imagePath in directoryContent) {
        UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
//        UIImage *img = [UIImage imageNamed:imagePath];
        [items addObject:img];
    }
    NSLog(@"imagesArray:%@", items);
}


@end
