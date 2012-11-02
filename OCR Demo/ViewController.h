//
//  ViewController.h
//  OCR Demo
//
//  Created by Brian Reber on 10/24/12.
//  Copyright (c) 2012 Brian Reber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
    // The UITextView that will contain the results
    IBOutlet UITextView *result;
    
    // The UIImageView that will contain the image being OCR'd
    IBOutlet UIImageView *imageView;
    
    // An activity indicator indicating whether the OCR is processing
    IBOutlet UIActivityIndicatorView *activity;
}

// The method to be called that will pop up the image picker
- (IBAction)takePicture;

// Update the UI when processing is completed
- (void)updateUI:(NSString *)text;

@end
