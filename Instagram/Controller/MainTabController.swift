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
        view.backgroundColor = .white
        let feed = templateNavigationController(
            unselectedImage: UIImage(named: "home-selected") ?? UIImage(),
            selectedImage: UIImage(named: "home-unselected") ?? UIImage(),
            rootViewController: FeedController())
        let search = templateNavigationController(
            unselectedImage: UIImage(named: "search-selected") ?? UIImage(),
            selectedImage: UIImage(named: "search-unselected") ?? UIImage(),
            rootViewController: SearchController())
        let image = templateNavigationController(
            unselectedImage: UIImage(named: "plus-photo") ?? UIImage(),
            selectedImage: UIImage(named: "plus-unselected") ?? UIImage(),
            rootViewController: ImageController())
        let notification = templateNavigationController(
            unselectedImage: UIImage(named: "like-selected") ?? UIImage(),
            selectedImage: UIImage(named: "like-unselected") ?? UIImage(),
            rootViewController: NotificationController())
        let profile = templateNavigationController(
            unselectedImage: UIImage(named: "profile-selected") ?? UIImage(),
            selectedImage: UIImage(named: "profile-unselected") ?? UIImage(),
            rootViewController: ProfileController())
        
//        let feed = FeedController()
//        let search = SearchController()
//        let image = ImageController()
//        let notification = NotificationController()
//        let profile = ProfileController()
        viewControllers = [feed, search, image, notification, profile]

    }
    
    func templateNavigationController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = unselectedImage
            nav.tabBarItem.selectedImage = selectedImage
            nav.navigationBar.tintColor = .black
        return nav
    }
}
