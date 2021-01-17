//
//  GenericViewController.swift
//  YogaExplore
//
//  Created by Ios Developer on 07/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

enum SelectedScreen {
    case articles
    case chat
    case settings
    case yoga
}

class GenericViewController: UIViewController {
    
    @IBOutlet private var headerLabel: UILabel? = UILabel()
    @IBOutlet private var detailTextLabel: UILabel? = UILabel()
    var selectedScreen: SelectedScreen = .articles

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViewDetails()
    }
    
    func updateViewDetails() {
        self.headerLabel?.textColor = Constants.AppColors.brownColor
        self.detailTextLabel?.textColor = Constants.AppColors.thinLightBrownColor

        switch selectedScreen {
        case .settings:
            self.headerLabel?.text = Constants.ScreenTitles.settingsScreen
        case .chat:
            self.headerLabel?.text = Constants.ScreenTitles.chatScreen
        case .articles:
            self.headerLabel?.text = Constants.ScreenTitles.articlesScreen
        default:
            break
        }
        self.detailTextLabel?.text = Constants.ScreenTitles.notImplementedText
    }
}
