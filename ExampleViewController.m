//
//  ExampleViewController.m
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

@synthesize managedObjectContext;

@synthesize userNewWord;


/*
- (void)setUserNewWord:(NewWordTable *)newWord
{
    _userNewWord = newWord ;
    NSLog(@"usrNewWord = %@",_userNewWord );
        NSLog(@"newWord = %@",newWord );
//    self.userNewWord = [newWord copy];
 //   self.title = photographer.name;
   // [self setupFetchedResultsController];
}*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipe];
        NSLog(@"usrNewWord = %@",self.userNewWord );
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)turnOffKeyBoard
{
    [self.exampleSentence resignFirstResponder];
    
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
- (IBAction)saveExample:(id)sender {
    NSLog(@"usernewword = %@", userNewWord);

    [ExampleTable createExampleOfWord:self.userNewWord example:self.exampleSentence.text inManagedObjectContext:self.managedObjectContext];
    
    
    
}

- (IBAction)doneInputting:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}
@end
