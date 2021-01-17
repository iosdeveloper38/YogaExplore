//
//  CustomNavigationController.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 07/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    var menu_button : UIButton = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.setNeedsLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK:- Navigation Controller Delegate Methods -
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        if viewController is ProfileViewController{
//            return;
//        }
//        APIRequest.sharedInstance.checkForPendingAPI()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
