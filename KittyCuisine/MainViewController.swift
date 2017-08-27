//
//  ViewController.swift
//  KittyCuisine
//
//  Created by 吴君恺 on 2017/8/27.
//  Copyright © 2017年 WJK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toogleDrawer() {
        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController
            as? DrawerContainerController {
            rootVC.toogleDrawer()
        }
    }
}

