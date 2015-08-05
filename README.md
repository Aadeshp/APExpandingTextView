# APExpandingTextView

[![CI Status](http://img.shields.io/travis/aadesh/APExpandingTextView.svg?style=flat)](https://travis-ci.org/aadesh/APExpandingTextView)
[![Version](https://img.shields.io/cocoapods/v/APExpandingTextView.svg?style=flat)](http://cocoapods.org/pods/APExpandingTextView)
[![License](https://img.shields.io/cocoapods/l/APExpandingTextView.svg?style=flat)](http://cocoapods.org/pods/APExpandingTextView)
[![Platform](https://img.shields.io/cocoapods/p/APExpandingTextView.svg?style=flat)](http://cocoapods.org/pods/APExpandingTextView)

![Sample](http://im.ezgif.com/tmp/ezgif-611583651.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

##### Swift

```swift
var textView: APExpandingTextView = APExpandingTextView(frame: ...)
textView._delegate = self
self.view.addSubview(textView)

...

// APExpandingTextViewDelegate
func textViewWillExpand(textView: APExpandingTextView!) {
    ...
}

func textViewDidExpand(textView: APExpandingTextView!) {
    ...
}
```

##### Objective-C
```objc
APExpandingTextView *textView = [[APExpandingTextView alloc] initWithFrame: ...];
textView._delegate = self
[self.view addSubView:textView];

...

// APExpandingTextViewDelegate
- (void)textViewWillExpand(textView: APExpandingTextView) {
    ...
}

- (void)textViewDidExpand(textView: APExpandingTextView) {
    ...
}
```

## Requirements

## Installation

APExpandingTextView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "APExpandingTextView"
```

## Author

Aadesh Patel, aadeshp95@gmail.com

## License

APExpandingTextView is available under the MIT license. See the LICENSE file for more info.
