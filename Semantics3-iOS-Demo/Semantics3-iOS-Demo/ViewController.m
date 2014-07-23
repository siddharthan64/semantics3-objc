//
//  ViewController.m
//  Semantics3-iOS-Demo
//
//  Created by Siddharthan Asokan on 10/11/13.
//  Copyright (c) 2013 Semantics3. All rights reserved.
//

#import "ViewController.h"
#define OAUTH_KEY @""
#define OAUTH_SECRET @""

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    semantics3_objc *sem = [[semantics3_objc alloc] initSemantic3Request:OAUTH_KEY withapiSecret:OAUTH_SECRET andEndpoints:@"products"];
    sem.delegate = self;
    [sem buildQuery:@"4992" andKeys:@"cat_id"];
    [sem buildQuery:@"Toshiba"andKeys:@"brand"];
    [sem buildQuery:@"1000000" andKeys:@"weight,gte"];
    [sem buildQuery:@"5000000" andKeys:@"weight,lt"];
    [sem buildQuery:@"frys.com <http://frys.com>"andKeys:@"sitedetails,name" ];
    [sem buildQuery:@"USD" andKeys:@"sitedetails,latestoffers,currency"];
    [sem buildQuery:@"100" andKeys:@"sitedetails,latestoffers,price,gte"];
    [sem buildQuery:@"dsc" andKeys:@"sort,name"];
    [sem buildQuery:@"10" andKeys:@"offset"];
    [sem buildQuery:@"5" andKeys:@"limit"];
    
    [sem runQuery];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)queryData:(NSString *)content{
    NSLog(@"content output: %@",content);
}

@end
