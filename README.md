# README #
================

## About ##

This is a sample app that shows the use of the [Tesseract](https://code.google.com/p/tesseract-ocr/) OCR engine on the iOS platform.

## Description ##

This app allows the user to take a picture of the text they want to recognize, and then automatically begins the processing of the recognition. The image taking code uses the `UIImagePickerController` APIs on the iOS platform. When the `UIImagePickerController` returns, the `Tesseract` library begins processing the image. Once processing is finished, the results and the `UIImage` are displayed side-by-side.

## Getting the Source ##

	git clone https://github.com/breber/ios_ocr_demo.git
	cd ios_ocr_demo
	git submodule update --init

## Steps Needed For Tesseract ##

1. Download the Tesseract Prebuilt Libraries
2. Download the iOS Wrapper for Tesseract
3. Download the English data for Tesseract
4. Import all of the files from the previous steps into a normal XCode project
5. Update the `C++ Standard Library` setting in the project Build Settings to `Compiler Default`
6. Import `Tesseract.h` into the file you will be performing OCR in
7. Start using the Tesseract APIs

## Helpful Links ##

* [Tesseract](https://code.google.com/p/tesseract-ocr/)
* [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition)
* [iOS Wrapper for Tesseract](https://github.com/ldiqual/tesseract-ios)
* [Tesseract Prebuilt Libraries](https://github.com/ldiqual/tesseract-ios-lib)