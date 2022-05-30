//
//  LandscapeManager.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import Foundation

class LandscapeManager {
    static let shared = LandscapeManager()
    var isFirstLaunch: Bool {
        get {
            !UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
}
