//
//  YogaCenterDetailHeaderCell.swift
//  YogaExplore
//
//  Created by Ios Developer on 15/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class YogaCenterDetailHeaderCell: UITableViewCell {
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var yogaBackgroundImageView: UIImageView!
    @IBOutlet private weak var yogaHeaderView: UIView!
    @IBOutlet private weak var ratingsView: RatingsView!
    @IBOutlet private weak var imageBottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet private weak var ratingViewLeadingConstrant: NSLayoutConstraint!
    @IBOutlet private weak var ratingViewTrailingConstraint: NSLayoutConstraint!
    private let animationDuration = 0.5
    private let ratingViewCornerRadius: CGFloat = 60
    private let ratingViewLeadingTrailingConstant: CGFloat = 40.0

    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        yogaHeaderView.clipsToBounds = true
        yogaHeaderView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: ratingViewCornerRadius)
        ratingViewLeadingConstrant.constant = CGFloat(Global.sharedInstance.screenWidth()/2)
        ratingViewTrailingConstraint.constant = CGFloat(Global.sharedInstance.screenWidth()/2)
        yogaBackgroundImageView.alpha = 0.95
        self.layoutIfNeeded()
    }
    
    func animateImageAndRatingView() {
        self.layoutIfNeeded()
        UIView.animate(withDuration: animationDuration) {
            self.imageBottomSpaceConstraint.constant = 0
            self.ratingViewLeadingConstrant.constant = self.ratingViewLeadingTrailingConstant
            self.ratingViewTrailingConstraint.constant = self.ratingViewLeadingTrailingConstant
            self.layoutIfNeeded()
        }
    }
}
