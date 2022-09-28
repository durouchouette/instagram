//
//  MainTabController.swift
//  Instagram
//
//  Created by Elodie Cari on 9/27/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }

    // MARK: - Helpers
    
    func configureViewControllers() {

        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(
            unselectedImage: UIImage(named: "home_selected") ?? UIImage(),
            selectedImage: UIImage(named: "home_unselected") ?? UIImage(),
            title: "Feed",
            rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigationController(
            unselectedImage: UIImage(named: "search_selected") ?? UIImage(),
            selectedImage: UIImage(named: "search_unselected") ?? UIImage(),
            title: "Search",
            rootViewController: SearchController())
        let image = templateNavigationController(
            unselectedImage: UIImage(named: "plus_unselected") ?? UIImage(),
            selectedImage: UIImage(named: "plus_unselected") ?? UIImage(),
            title: "Image",
            rootViewController: ImageController())
        let notification = templateNavigationController(
            unselectedImage: UIImage(named: "like_selected") ?? UIImage(),
            selectedImage: UIImage(named: "like_unselected") ?? UIImage(),
            title: "Notification",
            rootViewController: NotificationController())
        let profile = templateNavigationController(
            unselectedImage: UIImage(named: "profile_selected") ?? UIImage(),
            selectedImage: UIImage(named: "profile_unselected") ?? UIImage(),
            title: "Profile",
            rootViewController: ProfileController())
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemTeal
        viewControllers = [feed, search, image, notification, profile]

    }
    
    func templateNavigationController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        title: String,
        rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = unselectedImage
            nav.tabBarItem.selectedImage = selectedImage
            nav.tabBarItem.title = title
            nav.navigationBar.tintColor = .black
            
        return nav
    }
}
