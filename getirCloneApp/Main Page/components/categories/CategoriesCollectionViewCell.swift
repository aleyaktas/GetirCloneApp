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
        
        categoryImage.backgroundColor = .white
        categoryImage.layer.cornerRadius = 10
        categoryImage.layer.masksToBounds = false
        categoryImage.layer.shadowColor = UIColor.black.cgColor
        categoryImage.layer.shadowOpacity = 0.2
        categoryImage.layer.shadowRadius = 4
    }
}
