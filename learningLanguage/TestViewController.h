//
//  TestViewController.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;




@property (weak, nonatomic) IBOutlet UILabel *displayedExample;

@property (weak, nonatomic) IBOutlet UILabel *displayedWord;
@end
