//
//  LoginViewController.swift
//  CardWallet
//
//  Created by Ania Kuliś on 18.12.2017.
//  Copyright © 2017 Ania Kulis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginUser(userName: String, password: String) {
        let coreDataManager = CoreDataManager.shared
        if coreDataManager.fetchUser(named: userName, password: password) {
            UserStore.shared.loggedUserName = userName
        } else {
            // alert that user doesn't exist OR
            // save user in db
            UserStore.shared.loggedUserName = userName
        }
    }

}
