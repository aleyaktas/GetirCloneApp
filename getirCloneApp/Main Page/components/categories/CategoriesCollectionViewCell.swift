//
//  CategoriesCollectionViewCell.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 11.08.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureStyle()
    }
    
    private func configureStyle() {
        categoryImage.backgroundColor = .white
        categoryImage.layer.cornerRadius = 14
        categoryImage.layer.masksToBounds = false
        categoryImage.layer.shadowColor = UIColor.lightGray.cgColor
        categoryImage.layer.shadowOpacity = 0.2
        categoryImage.layer.shadowRadius = 4
    }
}
