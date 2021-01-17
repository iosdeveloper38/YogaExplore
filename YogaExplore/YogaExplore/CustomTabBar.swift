//
//  CustomTabBar.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 09/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBar: UIView, UIGestureRecognizerDelegate {
    var backgroundView: UIView = UIView()
    var yogaTab: CustomTabBarView!
    var chatTab: CustomTabBarView!
    var articlesTab: CustomTabBarView!
    var settingsTab: CustomTabBarView!
    var lastTabBarSelected: Int = Constants.tabBarTagStart
    weak var tabBarController: CustomTabBarController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createTabBarView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTabBarView(number: Int = Constants.numberOfTabs) {
        self.isUserInteractionEnabled = true
        self.backgroundView.isUserInteractionEnabled = true
        
        self.backgroundView = UIView.init(frame: CGRect(x: 0, y: 0, width: Global.sharedInstance.screenWidth(), height: Constants.tabBarHeight))
        self.addSubview(backgroundView)
        self.clipsToBounds = true


        for index in 0..<Constants.numberOfTabs {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tabSelected(gesture:)))
            gesture.delegate = self
            gesture.numberOfTapsRequired = 1
            let widthOfTab = Global.sharedInstance.screenWidth()/Double(number)
            let originX = Double(index)*(widthOfTab)
            let frame = CGRect(x:originX , y: 0, width: widthOfTab, height: Constants.tabBarHeight)
            let customTabBarView = CustomTabBarView(frame: frame)
            switch(index){
            case 0:
                yogaTab = customTabBarView
                yogaTab.isSelected = false
                yogaTab.tabBarType = .yoga
                yogaTab.tag = Constants.tabBarTagStart+index
                yogaTab.updateViewDetails()
                backgroundView.addSubview(yogaTab)
                yogaTab.isUserInteractionEnabled = true
                yogaTab.addGestureRecognizer(gesture)
            case 1:
                chatTab = customTabBarView
                chatTab.isSelected = false
                chatTab.tabBarType = .chat
                chatTab.tag = Constants.tabBarTagStart+index
                chatTab.updateViewDetails()
                backgroundView.addSubview(chatTab)
                chatTab.isUserInteractionEnabled = true
                chatTab.addGestureRecognizer(gesture)

            case 2:
                articlesTab = customTabBarView
                articlesTab.isSelected = false
                articlesTab.tabBarType = .articles
                articlesTab.tag = Constants.tabBarTagStart+index
                articlesTab.updateViewDetails()
                backgroundView.addSubview(articlesTab)
                articlesTab.isUserInteractionEnabled = true
                articlesTab.addGestureRecognizer(gesture)

            case 3:
                settingsTab = customTabBarView
                settingsTab.isSelected = false
                settingsTab.tabBarType = .settings
                settingsTab.tag = Constants.tabBarTagStart+index
                settingsTab.updateViewDetails()
                backgroundView.addSubview(settingsTab)
                settingsTab.isUserInteractionEnabled = true
                settingsTab.addGestureRecognizer(gesture)
            default:
                break
                
            }
        }
    }
    
    @objc func tabSelected(gesture: UITapGestureRecognizer) {
        if let tabBarView = gesture.view {
            let index = tabBarView.tag - Constants.tabBarTagStart
            if index != lastTabBarSelected {
                self.tabBarController?.setTabBarIndex(index: index)
            }
        }
    }
    
    func setTabBarSelectedIndex(index: Int) {
        if lastTabBarSelected == index {
            return
        }
        self.updateSelectedTabStatus(index: lastTabBarSelected-Constants.tabBarTagStart, isSelected: false)
        self.updateSelectedTabStatus(index: index, isSelected: true)
        lastTabBarSelected = Constants.tabBarTagStart+index
    }
    
    private func updateSelectedTabStatus(index: Int, isSelected: Bool) {
        switch(index){
        case 0:
            yogaTab.isSelected = isSelected
            yogaTab.updateTabBarItemDetails()
        case 1:
            chatTab.isSelected = isSelected
            chatTab.updateTabBarItemDetails()
        case 2:
            articlesTab.isSelected = isSelected
            articlesTab.updateTabBarItemDetails()
        case 3:
            settingsTab.isSelected = isSelected
            settingsTab.updateTabBarItemDetails()
            break
        default:
            break
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Constants.AppColors.shadowColor.cgColor
        self.layer.cornerRadius = CGFloat(Constants.tabBarHeight/2)
    }
}
