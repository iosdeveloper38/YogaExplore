//
//  OpeningHoursCell.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 15/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit

class OpeningHoursCell: UITableViewCell {
    @IBOutlet private weak var weekdayLabel: UILabel!
    @IBOutlet private weak var weekendLabel: UILabel!
    @IBOutlet private weak var weekdayTimingsLabel: UILabel!
    @IBOutlet private weak var weekendTimingsLabel: UILabel!
    @IBOutlet private weak var openningStatusLabel: UILabel!
    @IBOutlet private weak var dividerImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        weekdayLabel.textColor = Constants.AppColors.darkGreyColor
        weekendLabel.textColor = Constants.AppColors.darkGreyColor
        weekdayTimingsLabel.textColor = Constants.AppColors.lightBrownColor
        weekendTimingsLabel.textColor = Constants.AppColors.lightBrownColor
        openningStatusLabel.textColor = Constants.AppColors.lightBrownColor
        dividerImageView.backgroundColor = Constants.AppColors.tableViewSeparatorColor
    }
}
