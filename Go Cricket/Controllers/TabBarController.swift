//
//  TabBarController.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = ButtonColor
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.tabBarController?.selectedIndex = 0
        
        self.tabBar.items?[0].title = ""
        self.tabBar.items?[0].image = UIImage(named: "home_icon_unselected")
        self.tabBar.items?[0].selectedImage = UIImage(named: "home_icon_selected")
        
        self.tabBar.items?[1].title = ""
        self.tabBar.items?[1].image = UIImage(named: "league_icon_unselected")
        self.tabBar.items?[1].selectedImage = UIImage(named: "league_icon_selected")
        
        self.tabBar.items?[2].title = ""
        self.tabBar.items?[2].image = UIImage(named: "news_icon_unselected")
        self.tabBar.items?[2].selectedImage = UIImage(named: "news_icon_selected")
        
        self.tabBar.items?[3].title = ""
        self.tabBar.items?[3].image = UIImage(named: "setting_icon_unselected")
        self.tabBar.items?[3].selectedImage = UIImage(named: "setting_icon_selected")
        
        self.tabBarController?.selectedIndex = 0
        
    }
}
