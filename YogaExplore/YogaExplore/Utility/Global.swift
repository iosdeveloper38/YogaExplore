//
//  Global.swift
//  YogaExplore
//
//  Created by Ios Developer on 07/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import UIKit

class Global {
    
    static let sharedInstance = Global()   
    
    // MARK: Color Constants
    /**
     Convert hexstring into UIColor instance
     @param:hexstring an instance of String of 6 characters
     */
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /**
     Get scale factor of iPhone device with respect to iPhone 5,5s. This is used for calculating frames of objects in iphobe 6 and iPhone 6 plus
     */
    func getScaleFactorForiPhoneDevice() -> Double {
        
//        if Global.sharedInstance.IS_IPHONE_6P() {
//            return 1.29
//        }
//        else if Global.sharedInstance.IS_IPHONE_6() {
//            return 1.17
//        }
        return 1
    }
    
    /**
     Get custom font Ubuntu which will be used in the application having default size 12 and scale factor as per device
     @return UIFont instance
     */
    func setDefaultFont(size: CFloat = 12.0) -> UIFont {
        return UIFont(name: Constants.Font.regularFont, size: CGFloat(size))!
    }
    
    func setMediumFont(size: CFloat = 12.0) -> UIFont {
        return UIFont(name: Constants.Font.mediumFont, size: CGFloat(size))!
    }
    
    func setBoldFont(size: CFloat = 12.0) -> UIFont {
        return UIFont(name: Constants.Font.boldFont, size: CGFloat(size))!
    }
    
    /**
     Check whether objects contains any value or not
     @param:selectedObject an instance of AnyObject
     @return Bool instance
     */
    func validateObject(selectedObject:AnyObject?) -> Bool {
        
        if let obj = selectedObject {
            if (obj is NSNull) == false {
                return true
            }
        }
        return false
    }
    
    
    // MARK: Common Collection View generic Functions
    
    /**
     Get instance of UIApplicationDelegate
     @return an instance of UIApplicationDelegate
     */
    func kAppDelegateSwift() -> UIApplicationDelegate{
        return UIApplication.shared.delegate!
    }
    
    /**
     Checks whether the device is iPhone 4/4s
     @return yes if device is iPhone 4/4s
     */
    func IS_IPHONE_4() -> Bool{
        if UIScreen.main.bounds.size.height == 480{
            return true
        }
        else{
            return false
        }
    }
    
    /**
     @return instance of Main Storyboard used in the application
     */
    func kStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    /**
     Get screen width of iPhone device based on screen bounds
     @return CGFloat instance
     */
    func screenWidth() -> Double{
        return Double(UIScreen.main.bounds.size.width)
    }
    
    /**
     Get screen height of iPhone device based on screen bounds
     @return CGFloat instance
     */
    func screenHeight() -> Double{
        return Double(UIScreen.main.bounds.size.height)
    }
    /**
     Checks whether the device is running on operation system version 11.0 and above
     @return Bool
     */
    func IS_iOS11() -> Bool{
        if (UIDevice.current.systemVersion as NSString).floatValue < 11.0{
            return false
        }
        else{
            return true
        }
    }
    
    /**
     Get size (width and height) of text based on selected font, selected size bounds of text, actual text
     @param:textString an instance of String, font an instance of UIFont, size an instance of CGSize
     @return an instance of CGSize
     */
    func getSizeOfText(text textString:String?, selectedFont font:UIFont, selectedSize size:CGSize) ->(CGSize){
        
        let textAttributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading, .usesDeviceMetrics]
        let textRect = textString!.boundingRect(with: size, options: options , attributes: textAttributes, context: nil)
        return textRect.size
    }
    
    /**
     It will get text width and text height of attributed string for a selected size with its bounds
     @param:attributedTextString an instance of NSAttributedString,labelSize an instance of CGSize
     @return CGsize of text string
     */
    func getSizeOfAttributedText(attributedTextString:NSAttributedString?,withSize labelSize:CGSize) -> CGSize {
        if (attributedTextString?.string.count) != nil{
            
        }
        else{
            return CGSize.zero
        }
        let labelRect:CGRect = (NSAttributedString(attributedString: attributedTextString!)).boundingRect(with: labelSize, options: [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.usesFontLeading], context: nil)
        //        let labelRect:CGRect = (NSAttributedString(attributedString: attributedTextString!)).boundingRect(with: labelSize, options: [NSStringDrawingOptions.usesDeviceMetrics,NSStringDrawingOptions.usesFontLeading], context: nil)
        return labelRect.size
    }
    
    
    /**
     It will disable the selected view for specific time interval and enable it after that
     @param:sender an instance of UIView
     */
    func disableAndEnableInteractionOfView(sender:UIView?) -> Void {
        sender?.isUserInteractionEnabled = false
        let deadlineTime = DispatchTime.now() + .milliseconds(1600)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            sender?.isUserInteractionEnabled = true
        }
    }
    
    /**
     It will disable the selected view for specific time interval and enable it after that
     @param:sender an instance of UIView,timeDuration an instance of CGFloat
     */
    func disableAndEnableInteractionOfView(sender:UIView?,withTime timeDuration:CGFloat) -> Void {
        sender?.isUserInteractionEnabled = false
        var newTimeDuration:CGFloat = timeDuration
        if newTimeDuration < 1 {
            newTimeDuration = 1
        }
        newTimeDuration = newTimeDuration*1000
        let deadlineTime = DispatchTime.now() + .milliseconds(Int(newTimeDuration))
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            sender?.isUserInteractionEnabled = true
        }
    }
    
}


extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
