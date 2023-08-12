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
        
        startAutoScrolling()

    }
    
    private func startAutoScrolling() {
        let itemCount = sliderDataList.count
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            
            guard let currentIndexPath = self.collectionView.indexPathsForVisibleItems.first else { return }
            
            var nextItem = currentIndexPath.item + 1
            if nextItem >= itemCount {
                nextItem = 0
            }
            
            let nextIndexPath = IndexPath(item: nextItem, section: 0)
            self.collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = collectionView.frame.size.height
        layout.itemSize = CGSizeMake(screenWidth, screenHeight);
        collectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func customNibs() {
        let sliderCollectionCellNib: UINib = UINib(nibName: "SliderCollectionView", bundle: nil)
        collectionView.register(sliderCollectionCellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
    }
    
    private func addData() {
        let sliderData = [
            "slider1",
            "slider2",
            "slider3",
            "slider4",
            "slider5",
            "slider6",
            "slider7",
            "slider8",
            "slider9"
        ]
        
        for imageName in sliderData {
            let s1 = Slider(image_id: sliderDataList.count + 1, image_name: imageName)
            sliderDataList.append(s1)
        }

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

