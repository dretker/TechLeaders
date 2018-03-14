//
//  UserStore.swift
//  CardWallet
//
//  Created by Ania Kuliś on 14.03.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation

class UserStore {
    
    static let shared = UserStore()
    
    var loggedUserName: String
    
    private init() {
        self.loggedUserName = UUID().uuidString
    }
    
    func login(userName: String, password: String) -> Bool {
        let coreDataManager = CoreDataManager.shared
        if coreDataManager.fetchUser(named: userName, password: password) {
            loggedUserName = userName
            return true
        }
        return false
    }
    
    func logout(){
        loggedUserName = UUID().uuidString
    }
}
