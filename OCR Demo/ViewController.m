//
//  ViewController.m
//  OCR Demo
//
//  Created by Brian Reber on 10/24/12.
//  Copyright (c) 2012 Brian Reber. All rights reserved.
//

#import "ViewController.h"
#import "Tesseract.h"

@interface ViewController ()

@property Tesseract *tesseract;
@property UIImagePickerController *imagePicker;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    [self.imagePicker setAllowsEditing:YES];
    
    // Initialize the Tesseract instance with the trained data found in our bundle
    self.tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    
    // Set the character whitelist to just be numbers, lowercase and uppercase letters
    // and a few special symbols
    [self.tesseract setVariableValue:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-=*/!""'."
                              forKey:@"tessedit_char_whitelist"];
}

- (IBAction)takePicture
{
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self getImage];
}

- (IBAction)choosePicture {
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self getImage];
}

- (void)getImage {

    // Set the delegate to self so we get notified when the image has been chosen
    [self.imagePicker setDelegate:self];
    
    // Present the UIImagePickerController
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get the image that was chosen (the edited image
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // Display the image on the screen
    [imageView setImage:image];
    
    // Start animating the activity indicator
    [activity startAnimating];
    
    // Hide the UITextView while we are processing
    [result setHidden:YES];
    
    // Start processing the image in the background
    [self performSelectorInBackground:@selector(performRecognition:) withObject:image];
    
    // Hide the UIImagePickerController
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)performRecognition:(UIImage *)image
{
    // Start processing the image
    [self.tesseract setImage:image];
    [self.tesseract recognize];
    
    // When we are done processing, perform the updateUI method
    // on the main thread
    [self performSelectorOnMainThread:@selector(updateUI:)
                           withObject:[self.tesseract recognizedText]
                        waitUntilDone:YES];
    
    return [self.tesseract recognizedText];
}

- (void)updateUI:(NSString *)text
{
    // Update the text, stop animating the activity indicator,
    // and show the text view again
    result.text = text;
    [activity stopAnimating];
    [result setHidden:NO];
}

@end
