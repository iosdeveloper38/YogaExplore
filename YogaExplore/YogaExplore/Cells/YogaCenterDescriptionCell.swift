//
//  YogaCenterDescriptionCell.swift
//  YogaExplore
//
//  Created by Ios Developer on 15/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class YogaCenterDescriptionCell: UITableViewCell {
    @IBOutlet private weak var descriptionTextLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dividerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        descriptionTextLabel.textColor = Constants.AppColors.darkGreyColor
        descriptionLabel.textColor = Constants.AppColors.lightBrownColor
        dividerImageView.backgroundColor = Constants.AppColors.tableViewSeparatorColor
    }
}
