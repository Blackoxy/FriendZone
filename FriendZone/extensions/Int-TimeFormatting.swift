//
//  Int-TimeFormatting.swift
//  FriendZone
//
//  Created by Anh Nguyen on 8/26/21.
//

import Foundation

extension Int {
    func timeString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        let formattedString = formatter.string(from: TimeInterval(self)) ?? "0"

        if formattedString == "0" {
            return "GMT"
        } else {
            if formattedString.hasPrefix("-") {
                return "GMT\(formattedString)"
            } else {
                return "GMT+\(formattedString)"
            }
        }
    }
}
