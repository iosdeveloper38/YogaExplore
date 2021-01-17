//
//  YogaCenterDetailsView.swift
//  YogaExplore
//
//  Created by Ios Developer on 15/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

struct YogaCenterDetailsConstant {
    static let headerCellIdentifier = "YogaCenterDetailHeaderCell"
    static let locationCellIdentifier = "LocationCell"
    static let openingHoursCellIdentifier = "OpeningHoursCell"
    static let descriptionCellIdentifier = "YogaCenterDescriptionCell"
    static let reviewsCellIdentifier = "ReviewsCell"
}

class YogaCenterDetailsView: UIView {
    fileprivate let numberOfRows = 5
    @IBOutlet weak var yogaDetailsTableView: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func animateView() {
        if let cell = yogaDetailsTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? YogaCenterDetailHeaderCell {
            cell.animateImageAndRatingView()
        }
    }
    
    @IBAction func backPressed(sender: UIButton) {
        self.parentViewController?.navigationController?.popViewController(animated: true)
    }
}

extension YogaCenterDetailsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: YogaCenterDetailsConstant.headerCellIdentifier) as? YogaCenterDetailHeaderCell {
                return cell
            }
        case 1:
        if let cell = tableView.dequeueReusableCell(withIdentifier: YogaCenterDetailsConstant.locationCellIdentifier) as? LocationCell {
            return cell
        }
        case 2:
        if let cell = tableView.dequeueReusableCell(withIdentifier: YogaCenterDetailsConstant.openingHoursCellIdentifier) as? OpeningHoursCell {
            return cell
        }
        case 3:
        if let cell = tableView.dequeueReusableCell(withIdentifier: YogaCenterDetailsConstant.descriptionCellIdentifier) as? YogaCenterDescriptionCell {
            return cell
        }
        case 4:
        if let cell = tableView.dequeueReusableCell(withIdentifier: YogaCenterDetailsConstant.reviewsCellIdentifier) as? ReviewsCell {
            return cell
        }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
