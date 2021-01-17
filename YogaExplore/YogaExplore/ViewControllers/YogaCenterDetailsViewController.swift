//
//  YogaCenterDetailsViewController.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 07/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
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
