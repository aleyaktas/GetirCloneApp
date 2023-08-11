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
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
             design.minimumInteritemSpacing = 2
             design.minimumLineSpacing = 2
             
             let screenWidth = UIScreen.main.bounds.width
             let itemWidth = (screenWidth - 30) / 4
             
        design.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = design
    }
    
    private func customNibs() {
        let categoryCollectionCellNib: UINib = UINib(nibName: "CategoriesCollectionView", bundle: nil)
        collectionView.register(categoryCollectionCellNib, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    private func addData() {
        
        let c1 = Categories(category_id: 1, category_name: "Yaza Özel", category_image: "category1")
        let c2 = Categories(category_id: 1, category_name: "İndirimler", category_image: "category2")
        let c3 = Categories(category_id: 1, category_name: "Bana Özel", category_image: "category3")
        let c4 = Categories(category_id: 1, category_name: "Su & İçecek", category_image: "category4")
        let c5 = Categories(category_id: 1, category_name: "Meyve&Sebze", category_image: "category5")
        let c6 = Categories(category_id: 1, category_name: "Fırından", category_image: "category6")
        let c7 = Categories(category_id: 1, category_name: "Temel Gıda", category_image: "category7")
        let c8 = Categories(category_id: 1, category_name: "Atıştırmalık", category_image: "category8")
        let c9 = Categories(category_id: 1, category_name: "Dondurma", category_image: "category9")
        let c10 = Categories(category_id: 1, category_name: "Süt Ürünleri", category_image: "category10")
        let c11 = Categories(category_id: 1, category_name: "Kahvaltılık", category_image: "category11")
        let c12 = Categories(category_id: 1, category_name: "Yiyecek", category_image: "category12")
        let c13 = Categories(category_id: 1, category_name: "Fit&Form", category_image: "category13")
        let c14 = Categories(category_id: 1, category_name: "Kişisel Bakım", category_image: "category14")
        let c15 = Categories(category_id: 1, category_name: "Ev Bakım", category_image: "category15")
        let c16 = Categories(category_id: 1, category_name: "Ev& Yaşam", category_image: "category16")
        let c17 = Categories(category_id: 1, category_name: "Teknoloji", category_image: "category17")
        let c18 = Categories(category_id: 1, category_name: "Evcil Hayvan", category_image: "category18")
        let c19 = Categories(category_id: 1, category_name: "Bebek", category_image: "category19")
        let c20 = Categories(category_id: 1, category_name: "Cinsel Sağlık", category_image: "category20")

        categoriesList.append(c1)
        categoriesList.append(c2)
        categoriesList.append(c3)
        categoriesList.append(c4)
        categoriesList.append(c5)
        categoriesList.append(c6)
        categoriesList.append(c7)
        categoriesList.append(c8)
        categoriesList.append(c9)
        categoriesList.append(c10)
        categoriesList.append(c11)
        categoriesList.append(c12)
        categoriesList.append(c13)
        categoriesList.append(c14)
        categoriesList.append(c15)
        categoriesList.append(c16)
        categoriesList.append(c17)
        categoriesList.append(c18)
        categoriesList.append(c19)
        categoriesList.append(c20)
        print(categoriesList.count)

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
