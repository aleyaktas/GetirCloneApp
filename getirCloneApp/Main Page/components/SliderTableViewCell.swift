//
//  SliderTableViewCell.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 11.08.2023.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sliderDataList = [Slider]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customNibs()
        addData()
        configureCollectionViewLayout()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth)
        layout.itemSize = CGSize(width: itemWidth , height: 400)
        collectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func customNibs() {
        let sliderCollectionCellNib: UINib = UINib(nibName: "SliderCollectionView", bundle: nil)
        collectionView.register(sliderCollectionCellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
    }
    
    func addData() {
        let s1 = Slider(image_id: 1, image_name: "slider1")
        let s2 = Slider(image_id: 2, image_name: "slider2")
        let s3 = Slider(image_id: 3, image_name: "slider3")
        let s4 = Slider(image_id: 4, image_name: "slider4")
        let s5 = Slider(image_id: 5, image_name: "slider5")
        let s6 = Slider(image_id: 6, image_name: "slider6")
        let s7 = Slider(image_id: 7, image_name: "slider7")
        let s8 = Slider(image_id: 8, image_name: "slider8")
        let s9 = Slider(image_id: 9, image_name: "slider9")

        sliderDataList.append(s1)
        sliderDataList.append(s2)
        sliderDataList.append(s3)
        sliderDataList.append(s4)
        sliderDataList.append(s5)
        sliderDataList.append(s6)
        sliderDataList.append(s7)
        sliderDataList.append(s8)
        sliderDataList.append(s9)
    }
}

extension SliderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(sliderDataList.count)
        return sliderDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell {
            let slider = sliderDataList[indexPath.row]
               cell.imageView.image = UIImage(named: slider.image_name!)
               return cell
        }
                return UICollectionViewCell()

    }
    
    
}
