//
//  RatingsView.swift
//  YogaExplore
//
//  Created by Itesh Dutt on 15/01/21.
//  Copyright © 2021 Itesh Dutt. All rights reserved.
//

import Foundation
import UIKit

class RatingsView: UIView {
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var ratingValueLabel: UILabel!
    @IBOutlet private weak var dividerImageView: UIImageView!
    @IBOutlet private weak var ratingsCollectionView: UICollectionView!
    @IBOutlet private weak var favoriteImageView: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        updateViewProperties()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateViewProperties() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = Constants.AppColors.shadowColor.cgColor
        self.layer.borderWidth = 0.8
        self.ratingValueLabel.textColor = Constants.AppColors.brownColor
        self.ratingLabel.textColor = Constants.AppColors.darkGreyColor
        dividerImageView.backgroundColor = Constants.AppColors.ratingDividerColor
    }
}

extension RatingsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCell", for: indexPath) as? RatingCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 14, height: 14)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
