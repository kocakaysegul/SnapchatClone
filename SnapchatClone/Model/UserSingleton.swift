//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Ayşegül Koçak on 26.03.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton() // only instance from this singleton class
    
    var email = ""
    var username = ""
    
    
    private init() {
        
    }
    
}
