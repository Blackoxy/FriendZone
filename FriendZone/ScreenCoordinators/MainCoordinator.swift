//
//  MainCoordinator.swift
//  FriendZone
//
//  Created by Anh Nguyen on 8/26/21.
//

import UIKit

class MainCoordinator: Coordinator {
    let window: UIWindow
    required init(window: UIWindow) {
        self.window = window
    }

    lazy var friendsTableViewController: FriendsTableViewController = {
        let vc = FriendsTableViewController.instantiate()
        vc.coordinator = self
        return vc
    }()

    lazy var navController: UINavigationController = {
        let navController = UINavigationController(rootViewController: friendsTableViewController)
        return navController
    }()

    func start() {
        self.window.rootViewController = navController
    }

    func configure(friend: Friend) {
        let vc = SetFriendTableViewController.instantiate()
        vc.coordinator = self
        vc.friend = friend
        navController.pushViewController(vc, animated: true)
    }

    func update(friend: Friend) {
        guard let vc = navController.viewControllers.first
                as? FriendsTableViewController else { return }
        vc.update(friend: friend)
    }

}
