//
//  ViewController.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 8.08.2023.
//

import UIKit

class MainPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        let apperance = UITabBarAppearance()
        
        apperance.backgroundColor = .white
        
        changeColor(itemApperance: apperance.stackedLayoutAppearance)
        changeColor(itemApperance: apperance.inlineLayoutAppearance)
        changeColor(itemApperance: apperance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = apperance
        tabBarController?.tabBar.scrollEdgeAppearance = apperance
        }
      
    func changeColor(itemApperance: UITabBarItemAppearance) {
        itemApperance.selected.iconColor = UIColor(named: "purple")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = ""

        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView

        let imageSize = CGSize(width: 70, height: 70)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
    }
}


