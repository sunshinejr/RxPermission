# RxPermission

[![CocoaPods](https://img.shields.io/cocoapods/v/RxPermission.svg)](https://github.com/sunshinejr/RxPermission)
[![Version](https://img.shields.io/cocoapods/v/RxPermission.svg?style=flat)](http://cocoapods.org/pods/RxPermission)
[![License](https://img.shields.io/cocoapods/l/RxPermission.svg?style=flat)](http://cocoapods.org/pods/RxPermission)
[![Platform](https://img.shields.io/cocoapods/p/RxPermission.svg?style=flat)](http://cocoapods.org/pods/RxPermission)

[RxSwift](https://github.com/ReactiveX/RxSwift) bindings for [Permission](https://github.com/delba/Permission) API that helps you with Permissions in iOS.

## Installation

RxPermission is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxPermission"
```

## Usage

RxPermission makes a `rx_permission` Observable that you can subscribe in order to receive signals.

### Sample code
```swift
Permission
    .Contacts
    .rx_permission
    .subscribeNext { status in
        print("Status: \(status)")
    }
    .addDisposableTo(disposeBag)
```

### Available permissions:
```swift
public enum PermissionType {
    case Contacts
    case LocationAlways
    case LocationWhenInUse
    case Notifications
    case Microphone
    case Camera
    case Photos
    case Reminders
    case Events
    case Bluetooth
    case Motion
}
```

### Available statuses:
```swift
public enum PermissionStatus {
    case Authorized
    case Denied
    case Disabled
    case NotDetermined
}
```

For more info about permissions and statuses, please visit [Permission's README](https://github.com/delba/Permission#permission).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Sunshinejr, thesunshinejr@gmail.com, <a href="https://twitter.com/thesunshinejr">@thesunshinejr</a>

## License

RxPermission is available under the MIT license. See the LICENSE file for more info.
