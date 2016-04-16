//
//  ViewController.swift
//  RxPermission
//
//  Created by Sunshinejr on 04/16/2016.
//  Copyright (c) 2016 Sunshinejr. All rights reserved.
//

import UIKit
import Permission
import RxPermission
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Permission
            .LocationAlways
            .rx_permission
            .subscribeNext { status in
                self.label.text = "Status: \(status)"
            }
            .addDisposableTo(disposeBag)
    }
}

