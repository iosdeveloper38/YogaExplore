//
//  Constants.swift
//  YogaExplore
//
//  Created by Ios Developer on 07/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let tabBarHeight: Double = 90.0
    static let numberOfTabs = 4
    static let tabBarTagStart = 400

    struct AppColors {
        static let brownColor = Global.sharedInstance.hexStringToUIColor(hex: "#B9A089")
        static let darkGreyColor = Global.sharedInstance.hexStringToUIColor(hex: "#4B4948")
        static let lightBrownColor = Global.sharedInstance.hexStringToUIColor(hex: "#8D8784")
        static let thinLightBrownColor = Global.sharedInstance.hexStringToUIColor(hex: "#B7AFAB")
        static let whiteColor = Global.sharedInstance.hexStringToUIColor(hex: "#FFFFFF")
        static let tableViewSeparatorColor = Global.sharedInstance.hexStringToUIColor(hex: "#EDEBEA")
        static let shadowColor = Global.sharedInstance.hexStringToUIColor(hex: "#F4F3F3")
        static let ratingDividerColor = Global.sharedInstance.hexStringToUIColor(hex: "#DBD7D5")
    }
    
    struct Font {
        static let regularFont = "Ubuntu-Regular"
        static let mediumFont = "Ubuntu-Medium"
        static let boldFont = "Ubuntu-Bold"
    }
    
    struct TabBarConstant {
        static let yogaTitle = "Yoga"
        static let settingsTitle = "Settings"
        static let chatsTitle = "Chats"
        static let articlesTitle = "Articles"
        static let yogaSelectedImageName = "yogaTabSelected"
        static let yogaUnselectedImageName = "yogaTabUnselected"
        static let articlesSelectedImageName = "articlesTabSelected"
        static let articlesUnselectedImageName = "articlesTabUnselected"
        static let settingsSelectedImageName = "settingsTabSelected"
        static let settingsUnselectedImageName = "settingsTabUnselected"
        static let chatsSelectedImageName = "chatTabSelected"
        static let chatsUnselectedImageName = "chatTabUnselected"
    }
    
    struct ScreenTitles {
        static let yogaScreen = "Yoga"
        static let articlesScreen = "Articles"
        static let chatScreen = "Chat"
        static let settingsScreen = "Settings"
        static let notImplementedText = "Page is not implemented yet"
    }
}
