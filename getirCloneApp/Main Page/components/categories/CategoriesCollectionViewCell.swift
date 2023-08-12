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

        let shadowLayer = CALayer()
        shadowLayer.frame = categoryImage.frame
        shadowLayer.cornerRadius = categoryImage.layer.cornerRadius
        shadowLayer.backgroundColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 8
        shadowLayer.shadowOffset = CGSize(width: 0, height: 6)

        categoryImage.superview?.layer.insertSublayer(shadowLayer, below: categoryImage.layer)


    }
}
