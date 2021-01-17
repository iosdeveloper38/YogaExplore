//
//  ReviewsCell.swift
//  YogaExplore
//
//  Created by Ios Developer on 15/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class ReviewsCell: UITableViewCell {
    @IBOutlet private weak var writeReviewLabel: UILabel!
    @IBOutlet private weak var reviewButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        writeReviewLabel.textColor = Constants.AppColors.brownColor
    }
}
