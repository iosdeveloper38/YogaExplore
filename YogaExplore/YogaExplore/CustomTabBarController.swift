//
//  CustomTabBarController.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 07/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    var customTabBarView: CustomTabBar!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.autoresizesSubviews = false
        let tabBarHeight = Constants.tabBarHeight*1.5
        self.addTabBarController()
        self.hideTabBar()
        let frame = CGRect(x: 0, y: Double(self.view.frame.height) - Constants.tabBarHeight, width: Global.sharedInstance.screenWidth(), height: tabBarHeight)
        self.customTabBarView = CustomTabBar(frame: frame)
        self.customTabBarView.tabBarController = self
        self.view.addSubview(self.customTabBarView)
        self.delegate = self
        self.setTabBarIndex(index: 0)
    }
    
    func setTabBarIndex(index: Int) {
        self.selectedIndex = index
        self.customTabBarView.setTabBarSelectedIndex(index: index)
    }

    private func addTabBarController() {
        var viewControllers: [UIViewController] = []
        for index in 0..<Constants.numberOfTabs {
            viewControllers.append(self.createTabBar(index: index))
        }
        self.viewControllers = viewControllers
    }
    
    private func createTabBar(index: Int) -> UIViewController {
        var viewController: UIViewController
        let genericViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "genericViewController")
        switch index {
        case 0:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "yogaCenterDetailsViewController")
        case 1:
            viewController = genericViewController
            (viewController as? GenericViewController)?.selectedScreen = .chat
        case 2:
            viewController = genericViewController
            (viewController as? GenericViewController)?.selectedScreen = .articles
        default:
            viewController = genericViewController
            (viewController as? GenericViewController)?.selectedScreen = .settings
        }
        return viewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CustomTabBarController{

    @objc func hideTabBar(notification:NSNotification){
        self.hideTabBar()
    }
    
    func hideTabBar(){
        self.tabBar.isHidden = true
        return
    }
    
    @objc func showTabBar(notification:NSNotification?){
        customTabBarView.isHidden = false
        self.view.bringSubviewToFront(customTabBarView)
    }
}

extension CustomTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarSwitchAnimator()
    }
}

class TabBarSwitchAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}





