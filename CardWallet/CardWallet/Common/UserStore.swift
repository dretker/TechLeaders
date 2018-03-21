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
    private var isGuestUser = true
    
    private init() {
        self.loggedUserName = UUID().uuidString
    }
    
    func login(userName: String, password: String) -> Bool {
        let coreDataManager = CoreDataManager.shared
        if coreDataManager.fetchUser(named: userName, password: password) {
            loggedUserName = userName
            isGuestUser = false
            return true
        }
        return false
    }
    // if account exists in db return false
    func register(userNamed: String, password: String, email: String) -> Bool {
        let coreDataManager = CoreDataManager.shared
        coreDataManager.saveUser(login: userNamed, password: password, email: email)
        loggedUserName = userNamed
        return true
    }
    
    func loginGuest() {
        // save user
        // name = loggedUserName
    }
    
    func logout() {
        loggedUserName = UUID().uuidString
        if isGuestUser {
            // core data -> delete user named loggedUserName
            // coreData -> delete cards assigned to the loggedUserName // guest
        }
    }
}
