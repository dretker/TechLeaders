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
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginU: UITextField!
    @IBOutlet weak var passwordU: UITextField!
    
    
    @IBAction private func pressedLoginButton(_ sender: UIButton) {
        
        if(didFillLogin()){
        
            loginUser(userName: loginU.text!, password: passwordU.text!)
        
        guard let cardController = storyboard?.instantiateViewController(withIdentifier: "CardsTableViewController") as? CardsTableViewController else { return }
        let navigationController = UINavigationController(rootViewController: cardController)
        present(navigationController, animated: true, completion: nil)
        
        }
    }
    
    
    func loginUser(userName: String, password: String) {
        let coreDataManager = CoreDataManager.shared
        if coreDataManager.fetchUser(named: userName, password: password) {
            UserStore.shared.loggedUserName = userName
            
        } else {
            
            let alert = UIAlertController(title: "Warning:", message: "Such account does not exist", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            // alert that user doesn't exist OR
            // save user in db
            UserStore.shared.loggedUserName = userName
        }
    }
    
    
    
    func didFillLogin() -> Bool{
        
        if (loginU.hasText && passwordU.hasText){
            
            return true;
        }
        else{
            let alert = UIAlertController(title: "Info:", message: "All data have to be filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false;
        }
    }

    

}
