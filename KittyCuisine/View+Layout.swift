//
//  View+Layout.swift
//  KittyCuisine
//
//  Created by 吴君恺 on 2017/8/27.
//  Copyright © 2017年 WJK. All rights reserved.
//

import UIKit

extension UIView {
    func constraintSameFrame(to view: UIView) {
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        constraintSameSize(to: view)
    }
    
    func constraintSameSize(to view: UIView) {
        widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
