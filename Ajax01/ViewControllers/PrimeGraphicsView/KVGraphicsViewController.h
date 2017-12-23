//
//  DetailViewController.h
//  Ajax01
//
//  Created by Kenn Villegas on 12/22/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVGraphicsViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

