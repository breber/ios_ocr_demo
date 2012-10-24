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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)performRecognition {
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    [tesseract setVariableValue:@"0123456789" forKey:@"tessedit_char_whitelist"];
    [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
    [tesseract recognize];
    
    NSLog(@"%@", [tesseract recognizedText]);
    return [tesseract recognizedText];
}

@end
