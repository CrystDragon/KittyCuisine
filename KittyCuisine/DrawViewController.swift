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
        let movingToParent = isMovingToParentViewController
        print("drawer will appear: \(movingToParent)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let movingToParent = isMovingToParentViewController
        print("drawer did appear: \(movingToParent)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let removingFromParent = isMovingFromParentViewController
        print("drawer will disappear: \(removingFromParent)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let removingFromParent = isMovingFromParentViewController
        print("drawer did disappear: \(removingFromParent)")
    }

    deinit {
        print("drawer deinit")
    }
}
