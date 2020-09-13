//
//  TabBarController.swift
//  OnNews
//
//  Created by Caner Onat on 13.09.2020.
//  Copyright © 2020 OnNews. All rights reserved.
//

import Foundation
import UIKit

class TabBarController:UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        setupTabBar()
    }
    
    func setupTabBar() {
        let newsController =  UINavigationController(rootViewController: NewsViewController())
        newsController.tabBarItem.title = "News"
        newsController.tabBarItem.image = UIImage(named: "news_Icon")
        newsController.tabBarItem.selectedImage = UIImage(named: "news_Icon")
        let trendController =  UINavigationController(rootViewController: TrendViewController())
        trendController.tabBarItem.title = "Trend"
        trendController.tabBarItem.image = UIImage(named: "trend_Icon")
        trendController.tabBarItem.selectedImage = UIImage(named: "trend_Icon")
        
        let bookmarkController =  UINavigationController(rootViewController: BookMarkViewController())
        bookmarkController.tabBarItem.title = "Bookmark"
        bookmarkController.tabBarItem.image = UIImage(named: "bookmark_Icon")
        bookmarkController.tabBarItem.selectedImage = UIImage(named: "bookmark_Icon")
        viewControllers = [newsController,trendController,bookmarkController ]
        guard let items = tabBar.items else {return}
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
            
        }
    }
}

