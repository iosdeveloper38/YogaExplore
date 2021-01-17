//
//  LocationCell.swift
//  YogaExplore
//
//  Created by Ios Developer on 15/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class LocationCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var locationIconImageView: UIImageView!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var seeOnMapButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        nameLabel.textColor = Constants.AppColors.darkGreyColor
        addressLabel.textColor = Constants.AppColors.thinLightBrownColor
        seeOnMapButton.setTitleColor(Constants.AppColors.brownColor, for: .normal)
        seeOnMapButton.setTitleColor(Constants.AppColors.brownColor, for: .highlighted)
    }
}
