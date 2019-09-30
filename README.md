# StylableNavigationBar
[![Version](https://img.shields.io/cocoapods/v/StylableNavigationBar.svg?style=flat)](https://cocoapods.org/pods/StylableNavigationBar)
[![License](https://img.shields.io/cocoapods/l/StylableNavigationBar.svg?style=flat)](https://cocoapods.org/pods/StylableNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/StylableNavigationBar.svg?style=flat)](https://cocoapods.org/pods/StylableNavigationBar)

> 🧸 **StylableNavigationBar** provide a lightweight replacement for a standard **UINavigationController**, so you can easily manage your **navigation and status bar styles** throughout your iOS app

## Example
![StylableNavigationBar Demo](demo/demo.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 11, Swift 5

## Installation

1. StylableNavigationBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StylableNavigationBar'
```

2. Replace class for your UINavigationController to **StylableNavigationController**. If you are using Storyboard, you can change it using the Inspector at the right side of the Xcode:

![StylableNavigationBar Storyboard](demo/storyboard.png)

3. If you creating navigation controller from code you can do it same way as when you create a normal UINavigationController:

```swift
let navigationController = StylableNavigationController(rootViewController: childViewController)
```

4. Define preffered bar style for child view controller by making its extension

## Author

Pavlo Chernovolenko, Linkedin

## License

StylableNavigationBar is available under the MIT license. See the LICENSE file for more info.
