//
//  CustomTabBarView.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 09/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit


class CustomTabBarView: UIView {
    var imageView: UIImageView = UIImageView()
    var textLabel: UILabel = UILabel()
    let imageSize: CGFloat = 25
    var isSelected = false
    var tabBarType: SelectedScreen = .yoga

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.updateUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateUI() {
        imageView.frame = CGRect(x: (self.frame.width - imageSize)/2, y: 23, width: imageSize, height: imageSize)
        let textOriginY = imageView.frame.origin.y + imageView.frame.size.height
        textLabel.frame = CGRect(x: 0, y: textOriginY, width: self.frame.width, height: self.frame.height - textOriginY)
        self.addSubview(imageView)
        self.addSubview(textLabel)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.font = Global.sharedInstance.setDefaultFont(size: 12)
    }
    
    func updateViewDetails() {
        switch tabBarType {
        case .articles:
            self.textLabel.text = Constants.ScreenTitles.articlesScreen
        case .chat:
            self.textLabel.text = Constants.TabBarConstant.chatsTitle
        case .settings:
            self.textLabel.text = Constants.ScreenTitles.settingsScreen
        case .yoga:
            self.textLabel.text = Constants.ScreenTitles.yogaScreen
            break
        }
        self.updateTabBarItemDetails()
    }
    
    func updateTabBarItemDetails() {
        if isSelected {
            self.textLabel.textColor = Constants.AppColors.brownColor
        } else {
            self.textLabel.textColor = Constants.AppColors.darkGreyColor
        }
        switch tabBarType {
        case .articles:
            if isSelected {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.articlesSelectedImageName)
            } else {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.articlesUnselectedImageName)
            }
        case .chat:
            if isSelected {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.chatsSelectedImageName)
            } else {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.chatsUnselectedImageName)
            }
        case .settings:
            if isSelected {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.settingsSelectedImageName)
            } else {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.settingsUnselectedImageName)
            }
        case .yoga:
            if isSelected {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.yogaSelectedImageName)
            } else {
                self.imageView.image = UIImage(named: Constants.TabBarConstant.yogaUnselectedImageName)
            }
        }
    }
}
