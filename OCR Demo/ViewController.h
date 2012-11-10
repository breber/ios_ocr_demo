//
//  ViewController.h
//  OCR Demo
//
//  Created by Brian Reber on 10/24/12.
//  Copyright (c) 2012 Brian Reber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

// The method to be called that will pop up the image picker
- (IBAction)takePicture;

- (IBAction)choosePicture;

@end
