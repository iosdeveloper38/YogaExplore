//
//  YogaCenterDetailsViewController.swift
//  YogaExplore
//
//  Created by Ios Developer on 07/01/21.
//  Copyright © 2021 Ios Developer. All rights reserved.
//

import Foundation
import UIKit

class YogaCenterDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.view as? YogaCenterDetailsView)?.yogaDetailsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        (self.view as? YogaCenterDetailsView)?.yogaDetailsTableView.reloadData()
        (self.view as? YogaCenterDetailsView)?.animateView()
    }
}
