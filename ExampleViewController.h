//
//  ExampleViewController.h
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewWordTable+create.h"
#import "ExampleTable+create.h"
@interface ExampleViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveExample:(id)sender;
- (IBAction)doneInputting:(id)sender;



@property (nonatomic, strong) NewWordTable *userNewWord;
@property (weak, nonatomic) IBOutlet UITextField *exampleSentence;
@end
