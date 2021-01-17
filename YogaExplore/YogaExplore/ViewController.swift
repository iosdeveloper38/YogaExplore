//
//  ViewController.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 07/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateButtonProperties()
        // Do any additional setup after loading the view.
    }
    
    func updateButtonProperties() {
        startButton.titleLabel?.font = Global.sharedInstance.setDefaultFont(size: 22)
        startButton.setTitleColor(Constants.AppColors.whiteColor, for: UIControl.State.normal);
        startButton.setTitleColor(Constants.AppColors.whiteColor, for: UIControl.State.highlighted);
        startButton.backgroundColor = Constants.AppColors.brownColor
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = startButton.frame.height/2;
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let tabBarController = CustomTabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
}

