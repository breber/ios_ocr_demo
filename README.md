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

## Helpful Links ##

* [Tesseract](https://code.google.com/p/tesseract-ocr/)
* [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition)
* [iOS Wrapper for Tesseract](https://github.com/ldiqual/tesseract-ios)
* [Tesseract Prebuilt Libraries](https://github.com/ldiqual/tesseract-ios-lib)