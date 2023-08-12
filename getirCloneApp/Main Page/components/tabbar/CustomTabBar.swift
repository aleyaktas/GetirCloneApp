//
//  CustomTabBar.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 8.08.2023.
//

import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMiddleButton()
        tabbarStyle()
    }
        
    private func addMiddleButton() {
        let button = UIButton(type: .custom)
        let buttonSize: CGFloat = 60
        let buttonX = (self.view.bounds.width - buttonSize) / 2
        let tabBarHeight = self.tabBar.frame.size.height
        let buttonY = (self.view.bounds.height - tabBarHeight - buttonSize / 2) - buttonSize / 3
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonSize, height: buttonSize)
        button.layer.cornerRadius = buttonSize / 2
        button.backgroundColor = UIColor(named: "purple")
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(handleMenuButtonAct), for: .touchUpInside)
        
        view.addSubview(button)
    }

    @objc private func handleMenuButtonAct() {
          print("Click menu button")
    }
    
    private func tabbarStyle() {
        let lightGrayColor = UIColor.lightGray
        let lightGrayShadowImage = UIImage.imageWithColor(lightGrayColor)
        UINavigationBar.appearance().shadowImage = lightGrayShadowImage
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let homeNavigationController = tabBarController.viewControllers?[0] as? UINavigationController,
           let selectedNavigationController = viewController as? UINavigationController {
            if selectedNavigationController != homeNavigationController {
                self.present(homeNavigationController, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}

extension UIImage {
    static func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image ?? UIImage()
    }
}

