# RxPermission

[![CocoaPods](https://img.shields.io/cocoapods/v/RxPermission.svg)](https://github.com/sunshinejr/RxPermission)
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg)
[![License](https://img.shields.io/cocoapods/l/RxPermission.svg?style=flat)](http://cocoapods.org/pods/RxPermission)
[![Platform](https://img.shields.io/cocoapods/p/RxPermission.svg?style=flat)](http://cocoapods.org/pods/RxPermission)

[RxSwift](https://github.com/ReactiveX/RxSwift) bindings for [Permission](https://github.com/delba/Permission) API that helps you with Permissions in iOS.

## Installation

RxPermission is available through [CocoaPods](http://cocoapods.org). I can't guarantee it is working correctly
on Carthage, so if you want to help I'm happy to introduce it with your PR.

RxPermission should work with every Swift release >= 2.2, for detailed instructions check
info below.

## Swift 3.0
If you want to use RxPermission with Swift 3.0, as of now you have to use these lines below
in your Podfile to have it working (while waiting for the official release of Permission and RxSwift):

```ruby
pod 'RxPermission', '1.0.0-beta.2'
pod 'Permission', :git => 'https://github.com/delba/Permission', :branch => 'swift-3.0'
pod 'RxSwift', :git => 'https://github.com/ReactiveX/RxSwift'
```

## Below Swift 3.0

To install it, simply add the following line to your Podfile:

```ruby
pod "RxPermission", "~> 0.2"
```

## Usage

RxPermission makes a `rx_permission` Observable that you can subscribe in order to receive signals.

### Sample code
```swift
Permission
    .Contacts
    .rx.permission
    .subscribeNext { status in
        print("Status: \(status)")
    }
    .addDisposableTo(disposeBag)
```

### Available permissions:
```swift
public enum PermissionType {
    case contacts
    case locationAlways
    case locationWhenInUse
    case notifications
    case microphone
    case camera
    case photos
    case reminders
    case events
    case bluetooth
    case motion
}
```

### Available statuses:
```swift
public enum PermissionStatus {
    case authorized
    case denied
    case disabled
    case notDetermined
}
```

For more info about permissions and statuses, please visit [Permission's README](https://github.com/delba/Permission#permission).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Sunshinejr, thesunshinejr@gmail.com, <a href="https://twitter.com/thesunshinejr">@thesunshinejr</a>

## License

RxPermission is available under the MIT license. See the LICENSE file for more info.
