//
//  DrawerViewController.swift
//  KittyCuisine
//
//  Created by 吴君恺 on 2017/8/27.
//  Copyright © 2017年 WJK. All rights reserved.
//

import UIKit

class DrawerContainerController: UIViewController {
    
    var drawerViewController: UIViewController!
    var deskViewController: UIViewController!
    
    private var deskCover: UIView!
    
    enum DrawerState {
        case hidden
        case displayed
        case transitioning
    }
    private var drawerState: DrawerState = .hidden
    private var drawerViewOffsetConstraint: NSLayoutConstraint?
    // FIXME: make width generic
    private let drawerWidth: CGFloat = 200
    
    init(desk: UIViewController, drawer: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        deskViewController = desk;
        drawerViewController = drawer;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        guard let _ = drawerViewController,
            let _ = deskViewController else {
            fatalError("desk or drawer must be valid form beginning")
        }
        
        setupDesk()
    }
    
    private func setupDesk() {
        addChildViewController(deskViewController)
        let deskView: UIView = deskViewController.view
        view.addSubview(deskView)
        deskView.constraintSameFrame(to: view)
    }
    
    func toogleDrawer() {
        switch drawerState {
        case .displayed:
            updateDrawerVC(showing: false)
        case .hidden:
            updateDrawerVC(showing: true)
        case .transitioning:
            print("cannot toogle drawer when transitioning")
        }
    }
    
    func showDrawer() {
        switch drawerState {
        case .displayed:
            print("cannot show drawer when already displayed")
        case .transitioning:
            print("cannot show drawer when transitioning")
        case .hidden:
            updateDrawerVC(showing: true)
        }
    }
    
    func hideDrawer() {
        switch drawerState {
        case .hidden:
            print("cannot hide drawer when already hidden")
        case .transitioning:
            print("cannot hide drawer when transitioning")
        case .displayed:
            updateDrawerVC(showing: false)
        }
    }
    
    func updateDrawerVC(showing: Bool) {
        // prepare animation
        let drawerView: UIView = drawerViewController.view
        var offsetConstraint: NSLayoutConstraint
        if showing {
            addChildViewController(drawerViewController)
            drawerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(drawerView)
            
            drawerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            drawerView.widthAnchor.constraint(equalToConstant: drawerWidth).isActive = true
            drawerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            offsetConstraint = drawerView.rightAnchor.constraint(equalTo: view.leftAnchor)
            offsetConstraint.isActive = true
            drawerViewOffsetConstraint = offsetConstraint
            view.layoutIfNeeded() // pin to initial location
        } else {
            guard let trackingOffsetConstraint = drawerViewOffsetConstraint else {
                fatalError("offset constraint is missing for hiding")
            }
            offsetConstraint = trackingOffsetConstraint
            
            drawerViewController.willMove(toParentViewController: nil)
        }
        
        // start animation
        drawerState = .transitioning
        
        UIView.animate(withDuration: 0.5,
            animations: {
                offsetConstraint.constant = showing ? self.drawerWidth : 0
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                if showing {
                    self.drawerViewController.didMove(toParentViewController: self)
                    self.drawerState = .displayed
                } else {
                    drawerView.removeFromSuperview()
                    self.drawerViewController.removeFromParentViewController()
                    self.drawerState = .hidden
                    self.drawerViewOffsetConstraint = nil
                }
            }
        )
    }
}
