//
//  ViewController.swift
//  RxPermission
//
//  Created by Sunshinejr on 04/16/2016.
//  Copyright (c) 2016 Sunshinejr. All rights reserved.
//

import Permission
import RxSwift

public extension Permission {
    
    private struct AssociatedKeys {
        static var Permission = "rx_permissionInstance"
    }
    
    private func doLocked(closure: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        closure()
    }

    var rx_permission: Observable<PermissionStatus> {
        return rx_permissionInstance.asObservable()
    }
    
    var rx_permissionInstance: PublishSubject<PermissionStatus> {
        get {
            var permission: PublishSubject<PermissionStatus>!
            doLocked {
                let lookup = objc_getAssociatedObject(self, &AssociatedKeys.Permission) as? PublishSubject<PermissionStatus>
                if let lookup = lookup {
                    permission = lookup
                } else {
                    permission = PublishSubject<PermissionStatus>()
                    self.request { status in
                        permission.onNext(status)
                    }
                    self.rx_permissionInstance = permission
                }
            }
            return permission
        }
        
        set {
            doLocked {
                objc_setAssociatedObject(self, &AssociatedKeys.Permission, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}