//
//  Storyboarded.swift
//  FriendZone
//
//  Created by Anh Nguyen on 8/26/21.
//

import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: className) as! Self
    }
}

