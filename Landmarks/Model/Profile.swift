//
//  Profile.swift
//  Landmarks
//
//  Created by θηΈθ£ on 2021/4/16.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "π·"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"

        var id: String { self.rawValue }
    }
}
