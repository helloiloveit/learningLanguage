//
//  TestViewController.m
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "TestViewController.h"
#import "NewWordTable+retrieveData.h"
#import "ExampleTable+RetrieveData.h"

@interface TestViewController ()
@property (nonatomic, strong) NewWordTable * storeNewWord;
@property (nonatomic, strong) NSTimer *timerPointer;
@end

@implementation TestViewController
@synthesize managedObjectContext;
@synthesize storeNewWord;
- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionDown:

            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            [self changeWord];
            [self showExample];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self.timerPointer invalidate];
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
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipeRecognizer2 =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizer2.direction = UISwipeGestureRecognizerDirectionRight;
    
    
    
    [self.view addGestureRecognizer:swipeRecognizer2];
    [self.view addGestureRecognizer:swipeRecognizer];
    
    
}

-(void)setWordForDisplay
{
    NewWordTable *newWord =  [NewWordTable newWordByRandom:self.managedObjectContext];
    self.displayedWord.text = newWord.word;

}

-(void)changeWord
{
    self.displayedExample.text = @"";
    storeNewWord =  [NewWordTable newWordByRandom:self.managedObjectContext];
    
    [UIView animateWithDuration:3.0
                     animations:^{
                         self.displayedWord.alpha = 0.0f;
                         self.displayedWord.text = storeNewWord.word;
                         self.displayedWord.alpha = 1.0f;
                         
                     }];
    [self.timerPointer fire];

}

-(void)showExample
{
    ExampleTable *exampleSentence = [ExampleTable getExampleOfWord:self.storeNewWord inManagedObjectContext:self.managedObjectContext];


    self.displayedExample.text = exampleSentence.example;


    self.displayedExample.textColor = [UIColor blackColor];

    


}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipe];
    [self setWordForDisplay];
    [self showExample];

    self.displayedExample.text = @"";
    self.timerPointer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(showExample) userInfo:nil repeats:YES];
    [self.timerPointer invalidate];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
