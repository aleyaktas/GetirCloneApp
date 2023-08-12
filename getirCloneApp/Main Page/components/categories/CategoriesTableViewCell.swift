//
//  CategoriesTableViewCell.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 11.08.2023.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoriesList = [Categories]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customNibs()
        addData()
        configureCollectionViewLayout()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5 
        layout.minimumLineSpacing = 5

        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 15 * 5) / 4

        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.25)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        
    }

    
    
    private func customNibs() {
        let categoryCollectionCellNib: UINib = UINib(nibName: "CategoriesCollectionView", bundle: nil)
        collectionView.register(categoryCollectionCellNib, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    private func addData() {
        let categoryData = [
            ("Yaza Özel", "category1"),
            ("İndirimler", "category2"),
            ("Bana Özel", "category3"),
            ("Su&İçecek", "category4"),
            ("Meyve&Sebze", "category5"),
            ("Fırından", "category6"),
            ("Temel Gıda", "category7"),
            ("Atıştırmalık", "category8"),
            ("Dondurma", "category9"),
            ("Süt Ürünleri", "category10"),
            ("Kahvaltılık", "category11"),
            ("Yiyecek", "category12"),
            ("Fit&Form", "category13"),
            ("Kişisel Bakım", "category14"),
            ("Ev Bakım", "category15"),
            ("Ev&Yaşam", "category16"),
            ("Teknoloji", "category17"),
            ("Evcil Hayvan", "category18"),
            ("Bebek", "category19"),
            ("Cinsel Sağlık", "category20")
        ]
        
        for (categoryName, imageName) in categoryData {
            let category = Categories(category_id: categoriesList.count + 1, category_name: categoryName, category_image: imageName)
            categoriesList.append(category)
        }
    }
}



extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            let category = categoriesList[indexPath.row]
                cell.categoryImage.image = UIImage(named: category.category_image!)
                cell.categoryName.text = category.category_name!
               return cell
        }
        return UICollectionViewCell()
    }
    
}
