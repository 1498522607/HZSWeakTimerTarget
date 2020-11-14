//
//  HZSViewController.m
//  HZSWeakTimerTarget
//
//  Created by hzsMac on 11/14/2020.
//  Copyright (c) 2020 hzsMac. All rights reserved.
//

#import "HZSViewController.h"
#import "HZSTestViewController.h"

@interface HZSViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HZSTestViewController * testVC = [[HZSTestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
