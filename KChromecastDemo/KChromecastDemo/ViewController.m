//
//  ViewController.m
//  KChromecastDemo
//
//  Created by Eliza Sapir on 07/12/2015.
//  Copyright © 2015 Kaltura. All rights reserved.
//

#import "ViewController.h"
#import "KPViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (KPViewController *)player {
    if (!_player) {
        // Account Params
        KPPlayerConfig *config = [[KPPlayerConfig alloc] initWithServer:@"http://cdnapi.kaltura.com"
                                                                        uiConfID:@"32105351"
                                                                       partnerId:@"2031091"];
        // Video Entry
        config.entryId = @"0_7v0pr7gm";
        
        // Setting this property will cache the html pages in the limit size
        config.cacheSize = 100;
        _player = [[KPViewController alloc] initWithConfiguration:config];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(changeMedia)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Change Media" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 10.0, 160.0, 40.0);
    [self.view addSubview:button];
    return _player;
}

- (void)changeMedia {
    [_player changeMedia:@"0_ofr2x35n"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Setting player frame
    CGRect frame = self.player.view.frame;
    frame.origin.y = 50.0;
    self.player.view.frame = frame;
    
    // Adding player as subview
    [self.player loadPlayerIntoViewController:self];
    [self.view addSubview:self.player.view];
}

@end
