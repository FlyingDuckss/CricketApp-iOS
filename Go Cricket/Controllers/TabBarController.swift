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
    }
}
