//
//  ViewController.m
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ViewController.h"
#import "NewWordViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!self.managedObjectContext) [self createManagedObjectContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createManagedObjectContext
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:@"test23"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]]) {
        [document saveToURL:url
           forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success) {
                  self.managedObjectContext = document.managedObjectContext;

              }
          }];
    } else if (document.documentState == UIDocumentStateClosed) {
        [document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                self.managedObjectContext = document.managedObjectContext;
            }
        }];
    } else {
        self.managedObjectContext = document.managedObjectContext;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"inputWord"]) {
        NewWordViewController  *desSegue = [segue destinationViewController];
        desSegue.managedObjectContext = self.managedObjectContext;
    } else if ([segue.identifier isEqualToString:@"check_word"]) {
        NewWordViewController  *desSegue = [segue destinationViewController];
        desSegue.managedObjectContext = self.managedObjectContext;
    }
}
@end
