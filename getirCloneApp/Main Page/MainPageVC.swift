//
//  ViewController.swift
//  getirCloneApp
//
//  Created by Aleyna Aktaş on 8.08.2023.
//

import UIKit

class MainPageVC: UIViewController {

    @IBOutlet weak var addressButtonLabel: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTabBar()
        editAdressStyle()
        customNibs()
        
        tableView.backgroundColor = UIColor.lightGray
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func customNibs() {
        let sliderCellNib: UINib = UINib(nibName: "SliderTableView", bundle: nil)
        tableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        let categoryCellNib: UINib = UINib(nibName: "CategoriesTableView", bundle: nil)
        tableView.register(categoryCellNib, forCellReuseIdentifier: "CategoriesTableViewCell")
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
    
    private func setupTabBar() {
        let apperance = UITabBarAppearance()
        
        apperance.backgroundColor = .white
        
        changeColor(itemApperance: apperance.stackedLayoutAppearance)
        changeColor(itemApperance: apperance.inlineLayoutAppearance)
        changeColor(itemApperance: apperance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = apperance
        tabBarController?.tabBar.scrollEdgeAppearance = apperance
    }
    
    private func editAdressStyle() {
        let fullAddress = "Ev, Atatürk, 1938.Sk, no: 14, Merkez/Ankara"
         
        if let commaRange = fullAddress.range(of: ",") {
            let firstPart = String(fullAddress[..<commaRange.lowerBound])
            
            let attributedText = NSMutableAttributedString(string: fullAddress)
            
            attributedText.removeAttribute(.foregroundColor, range: NSRange(location: 0, length: attributedText.length))
            attributedText.removeAttribute(.font, range: NSRange(location: 0, length: attributedText.length))
            
            let nsString = fullAddress as NSString
            
            let rangeOfFirstPart = NSRange(location: 0, length: nsString.range(of: firstPart).upperBound)
            
            attributedText.addAttribute(.foregroundColor, value: UIColor(named: "purple") ?? UIColor.purple, range: rangeOfFirstPart)
            attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attributedText.length))
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: rangeOfFirstPart)
            
            addressButtonLabel.setAttributedTitle(attributedText, for: .normal)
        }
    }
    
}

extension MainPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as? SliderTableViewCell {
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as? CategoriesTableViewCell {
                return cell2
            }
        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        return self.tableView.frame.size.height - 200
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
