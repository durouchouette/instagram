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

        let feed = FeedController()
        let search = SearchController()
        let image = ImageController()
        let notification = NotificationController()
        let profile = ProfileController()
        
        viewControllers = [feed, search, image, notification, profile]
    }
}
