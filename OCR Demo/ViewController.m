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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    [self.tesseract setVariableValue:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-=*/"
                              forKey:@"tessedit_char_whitelist"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [imagePicker setAllowsEditing:YES];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [imageView setImage:image];
    [activity startAnimating];
    [result setHidden:YES];
    [self performSelectorInBackground:@selector(performRecognition:) withObject:image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSString *)performRecognition:(UIImage *)image {
    [self.tesseract setImage:image];
    [self.tesseract recognize];
    
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:[self.tesseract recognizedText] waitUntilDone:YES];
    
    return [self.tesseract recognizedText];
}

- (void)updateUI:(NSString *)text {
    result.text = text;
    [activity stopAnimating];
    [result setHidden:NO];
}

@end
