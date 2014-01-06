  //
//  NewWordViewController.m
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "NewWordViewController.h"
#import "NewWordTable+create.h"
#import "ExampleViewController.h"
@interface NewWordViewController ()

@property (nonatomic, strong) NewWordTable *wordStore;
@end

@implementation NewWordViewController
@synthesize managedObjectContext;
@synthesize wordStore;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipe];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressDone:(id)sender {
    //save word
     wordStore =  [NewWordTable newWordWithMeaning:self.inputtedWord.text withMeanning:self.wordMeanning.text inManagedObjectContext:self.managedObjectContext];
    NSLog(@"wordStore = %@", wordStore);
    //segue
    [self performSegueWithIdentifier:@"input_example" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"input_example"]) {
        ExampleViewController  *desSegue = [segue destinationViewController];
        NSLog(@"managecontext = %@", [self.managedObjectContext description]);
        desSegue.managedObjectContext = self.managedObjectContext;
        desSegue.userNewWord = self.wordStore;
    }
}

-(void)turnOffKeyBoard
{
    [self.inputtedWord resignFirstResponder];
    [self.wordMeanning resignFirstResponder];
    
}
- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionDown:
            [self turnOffKeyBoard];
            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        case UISwipeGestureRecognizerDirectionRight:
            [self.navigationController popViewControllerAnimated:YES];
            // disable timer for both left and right swipes.
            break;
        default:
            break;
    }
}
-(void)initSwipe
{
    
    UISwipeGestureRecognizer *swipeRecognizer =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:swipeRecognizer];
    
    
}
@end
