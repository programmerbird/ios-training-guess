//
//  GuessViewController.h
//  Guess
//
//  Created by Sittipon Simasanti on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource> {
    
    UIImageView *tooHighImageView;
    UIImageView *winImageView;
    UIImageView *tooLowImageView;
    UILabel *statusLabel;
    UIPickerView *numberPicker;
    
    int number;
    int turns;
}
@property (nonatomic, retain) IBOutlet UIImageView *tooHighImageView;
@property (nonatomic, retain) IBOutlet UIImageView *winImageView;
@property (nonatomic, retain) IBOutlet UIImageView *tooLowImageView;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UIPickerView *numberPicker;

-(void)resetGame;
-(void)checkResult: (int)value;
-(IBAction)guessButtonDidClick:(id)sender;

@end
