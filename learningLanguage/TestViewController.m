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
//@property  (nonatomic,assign) NSInteger *countDownNumber;
@end

@implementation TestViewController
@synthesize managedObjectContext;
@synthesize storeNewWord;
//@synthesize countDownNumber;

#define COUNT_DOWN_TIMER 6;


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

            [self stopCountDown];

            [self changeWord];

            [self startCountDown];
         //   [self showExample];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self stopCountDown];
            [self.navigationController popViewControllerAnimated:YES];
            // disable timer for both left and right swipes.
            break;
        default:
            break;
    }
}

-(void)stopCountDown
{
    [self.timerPointer invalidate];
    self.timerPointer = nil;

    countDownNumber =COUNT_DOWN_TIMER;
    self.timerInfo.text = @"";
}
-(void)startCountDown
{
    self.timerPointer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownClock) userInfo:nil repeats:YES];
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
}
-(void)resetCountDownNumber
{

    countDownNumber = 0;
}

-(void)countDownClock
{
    if (countDownNumber == 0) {
        [self stopCountDown];
        [self showExample];
        [self startCountDown];
    } else {
        countDownNumber = countDownNumber - 1;

        int myInt = countDownNumber;
        NSString *temp = [NSString stringWithFormat:@"%d", myInt];
        self.timerInfo.text = temp;
    }
    
}
-(void)showExample
{
    ExampleTable *exampleSentence = [ExampleTable getExampleOfWord:self.storeNewWord inManagedObjectContext:self.managedObjectContext];


    self.displayedExample.text = exampleSentence.example;


    self.displayedExample.textColor = [UIColor blackColor];

    


}

-(void)startTesting
{
    [self changeWord];
    
    [self startCountDown];
}
-(void)initValue
{
    countDownNumber = COUNT_DOWN_TIMER  ;
    self.displayedExample.text = @"";
    self.displayedWord.text = @"";
    self.timerInfo.text = @"";
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipe];
    [self initValue];
    
    [self startTesting];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
