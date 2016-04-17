//
// RxPermission.swift
//
// Copyright (c) 2016 Sunshinejr <thesunshinejr@gmail.com>
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Permission
import RxSwift

public extension Permission {
    /// Reactive wrapper for `Permission` instance.
    public var rx_permission: Observable<PermissionStatus> {
        return rx_permissionInstance.asObservable()
    }
}

// MARK: - Permission

extension Permission: AssociatedObject {
    private var rx_permissionInstance: PublishSubject<PermissionStatus> {
        get {
            var permission: PublishSubject<PermissionStatus>!
            
            doLocked {
                if let lookup = self.associatedObject(&.permission) as? PublishSubject<PermissionStatus> {
                    permission = lookup
                } else {
                    permission = PublishSubject<PermissionStatus>()
                    self.request { permission.onNext($0) }
                    self.rx_permissionInstance = permission
                }
            }
            
            return permission
        }
        
        set {
            doLocked {
                self.associatedObject(&.permission, object: newValue)
            }
        }
    }
    
    private func doLocked(closure: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        closure()
    }
}

// MARK: - AssociatedObject

private protocol AssociatedObject {}

private extension AssociatedObject where Self: AnyObject {
    func associatedObject(inout key: String) -> AnyObject! {
        return objc_getAssociatedObject(self, &key)
    }
    
    func associatedObject(inout key: String, object: AnyObject) {
        objc_setAssociatedObject(self, &key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

// MARK: - String

private extension String {
    static var permission = "rx_permissionInstance"
}
