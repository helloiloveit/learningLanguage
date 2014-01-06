//
//  NewWordViewController.h
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewWordViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *headerInfo;

@property (weak, nonatomic) IBOutlet UITextField *inputtedWord;

@property (weak, nonatomic) IBOutlet UITextField *wordMeanning;


- (IBAction)pressDone:(id)sender;

@end
