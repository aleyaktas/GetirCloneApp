//
//  CustomTabBar.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 8.08.2023.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.tabBarController?.tabBar.layer.borderWidth = 2
        self.tabBarController?.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        
        let tabItems: [(image: String, viewController: UIViewController, isCenter: Bool)] = [
            ("home", MainPageVC(), false),
            ("search", MainPageVC(), false),
            ("menu", MainPageVC(), true),
            ("profile", MainPageVC(), false),
            ("gift", MainPageVC(), false)
        ]
        
        let viewControllers = tabItems.map { item in
            let viewController = UINavigationController(rootViewController: item.viewController)
            
            if item.isCenter {
                let circleSize: CGFloat = 60
                let circleView = UIView(frame: CGRect(x: 0, y: 0, width: circleSize, height: circleSize))
                circleView.backgroundColor = UIColor(named: "purple")
                circleView.layer.cornerRadius = circleSize / 2
                
                if let centerImage = UIImage(named: item.image) {
                    UIGraphicsBeginImageContextWithOptions(circleView.bounds.size, false, 0)
                    if let context = UIGraphicsGetCurrentContext() {
                        circleView.layer.render(in: context)
                        if let circleImage = UIGraphicsGetImageFromCurrentImageContext() {
                            UIGraphicsEndImageContext()
                            
                            let imageSize = CGSize(width: circleSize, height: circleSize)
                            let xOffset = (imageSize.width - centerImage.size.width) / 2
                            let yOffset = (imageSize.height - centerImage.size.height) / 2
                            
                            UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
                            circleImage.draw(at: .zero)
                            centerImage.draw(at: CGPoint(x: xOffset, y: yOffset))
                            if let combinedImage = UIGraphicsGetImageFromCurrentImageContext() {
                                UIGraphicsEndImageContext()
                                
                                viewController.tabBarItem.image = combinedImage.withRenderingMode(.alwaysOriginal)
                                viewController.tabBarItem.selectedImage = combinedImage.withRenderingMode(.alwaysOriginal)
                            }
                        }
                    }
                }
            } else {
                viewController.tabBarItem.image = UIImage(named: item.image)?.withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.selectedImage = UIImage(named: "\(item.image)_selected")?.withRenderingMode(.alwaysOriginal)
            }
            
            return viewController
        }
        
        setViewControllers(viewControllers, animated: true)
    }
}

