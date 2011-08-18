//
//  GuessViewController.m
//  Guess
//
//  Created by Sittipon Simasanti on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GuessViewController.h"

@implementation GuessViewController
@synthesize tooHighImageView;
@synthesize winImageView;
@synthesize tooLowImageView;
@synthesize statusLabel;
@synthesize numberPicker;

- (void)dealloc
{
    [tooHighImageView release];
    [winImageView release];
    [tooLowImageView release];
    [statusLabel release];
    [numberPicker release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 10;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%d", row];
}

#pragma mark - UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 45;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 80;
}

#pragma mark - Check result
-(void)checkResult: (int)value {
    
    UIImageView *showingImage = nil;
    if(value == number){
        showingImage = self.winImageView;
        [self.statusLabel setText: @"Yippy!"];
        [self resetGame];
        
    }else if(value < number){
        showingImage = self.tooLowImageView;
        NSString *status = [NSString stringWithFormat:
                            @"%d is too low.", value];
        [self.statusLabel setText: status];
    }else if(value > number){
        showingImage = self.tooHighImageView;
        NSString *status = [NSString stringWithFormat:
                            @"%d is too high.", value];
        [self.statusLabel setText: status];
    }
    
    /*
     
    [self.tooHighImageView setHidden: YES];
    [self.tooLowImageView setHidden: YES];
    [self.winImageView setHidden: YES];
    [showingImage setHidden: NO];
     
    // before
    [showingImage setCenter: CGPointMake(160, 200)];
    [showingImage setAlpha: 0.0];
    [showingImage setTransform:CGAffineTransformMakeScale(0.2, 0.2)]; 

    [UIView beginAnimations:@"Transform" context:NULL];
    [UIView setAnimationDuration: 0.3f];

    // after
    [showingImage setCenter: CGPointMake(160, 100)];
    [showingImage setAlpha: 1.0];
    [showingImage setTransform:CGAffineTransformMakeScale(1.0, 1.0)];     
    [UIView commitAnimations];
     */
    
    UIImageView *previousImage = nil;
    if(![tooHighImageView isHidden])
        previousImage = self.tooHighImageView;
    if(![tooLowImageView isHidden])
        previousImage = self.tooLowImageView;
    if(![winImageView isHidden])
        previousImage = self.winImageView;
    
    [UIView beginAnimations:@"Off" context:NULL];
    [UIView setAnimationDuration: 0.3f];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:previousImage cache:YES];
    [previousImage setHidden: YES];
    [showingImage setHidden: NO];
    [UIView commitAnimations];


    [UIView beginAnimations:@"On" context:NULL];
    [UIView setAnimationDelay: 0.3f];
    [UIView setAnimationDuration: 0.3f];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:showingImage cache:YES];
    [UIView commitAnimations];
}

- (IBAction)guessButtonDidClick:(id)sender {
    int digitA = [self.numberPicker selectedRowInComponent:0];
    int digitB = [self.numberPicker selectedRowInComponent:1];    
    
    [self checkResult:digitA * 10 + digitB];
}


#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self resetGame];
    [self.statusLabel setText: @"Let the Game Begin!"];
    [self.tooHighImageView setHidden: YES];
    [self.tooLowImageView setHidden: YES];
}

-(void)resetGame {
    number = arc4random() % 100;
    turns = 0;
    NSLog(@"Random result: %d", number);
}

- (void)viewDidUnload
{
    [self setTooHighImageView:nil];
    [self setWinImageView:nil];
    [self setTooLowImageView:nil];
    [self setStatusLabel:nil];
    [self setNumberPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
