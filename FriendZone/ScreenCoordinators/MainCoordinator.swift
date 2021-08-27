//
//  MainCoordinator.swift
//  FriendZone
//
//  Created by Anh Nguyen on 8/26/21.
//

import UIKit

class MainCoordinator: Coordinator, FriendsTableDelegate, SetFriendDelegate {
    func addedFriend(friend: Friend) {
        guard let vc = navController.viewControllers.first
                as? FriendsTableViewController else { return }
        vc.update(friend: friend)
    }

    func configureFriendSelected(friend: Friend) {
        let vc = SetFriendTableViewController.instantiate()
        vc.delegate = self
        vc.friend = friend
        navController.pushViewController(vc, animated: true)
    }

    let window: UIWindow
    required init(window: UIWindow) {
        self.window = window
    }

    lazy var friendsTableViewController: FriendsTableViewController = {
        let vc = FriendsTableViewController.instantiate()
        vc.delegate = self
        return vc
    }()

    lazy var navController: UINavigationController = {
        let navController = UINavigationController(rootViewController: friendsTableViewController)
        return navController
    }()

    func start() {
        self.window.rootViewController = navController
    }
}
