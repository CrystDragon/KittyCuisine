//
//  DrawViewController.swift
//  KittyCuisine
//
//  Created by 吴君恺 on 2017/8/27.
//  Copyright © 2017年 WJK. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("drawer did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("drawer will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("drawer did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("drawer will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("drawer did disappear")
    }

    deinit {
        print("drawer deinit")
    }
}
