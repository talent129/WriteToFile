//
//  ViewController.m
//  WriteToFileTest
//
//  Created by iMac on 16/5/5.
//  Copyright © 2016年 Cai. All rights reserved.
//

/*
 将数据写入到plist文件中，但是此种方式只能存储NSString、NSArray、NSDictionary等类型文件。若想存储自定义类型的数据，需要解归档
 */

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setData];
    
    NSLog(@"---first--%@", array);
    
    NSArray *arr = [[NSArray alloc] initWithContentsOfFile:[self savePath]];
    NSLog(@"arr---%@--", arr);
    NSLog(@"--沙盒--%@", NSHomeDirectory());
}

- (void)setData
{
    array = @[@"Hello", @"你好", @"C"];
    [array writeToFile:[self savePath] atomically:YES];
}

- (NSString *)savePath
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"test.plist"];
    return path;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
