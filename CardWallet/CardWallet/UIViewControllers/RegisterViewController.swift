//
//  RegisterViewController.swift
//  CardWallet
//
//  Created by Ania Kuliś on 18.12.2017.
//  Copyright © 2017 Ania Kulis. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    private class NewUser{
        var userLogin: String?
        var userPassword: String?
        var email: String?
    }
    
    var coreDataManager = CoreDataManager.shared
    private var newUser = NewUser()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    

    
    func didFillRegistration() -> Bool{
        
        
        let providedEmailAddress = email.text
        let EmailAddressValid = ValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        
        if (login.hasText && password.hasText && email.hasText){
            
            if (!EmailAddressValid){
                let alertEmailFailed = UIAlertController(title: "Warning:", message: "E-mail address is not correct!", preferredStyle: UIAlertControllerStyle.alert)
                alertEmailFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alertEmailFailed, animated: true, completion: nil)
                return false;
            }
            return true;
        }
        else{
            let alert = UIAlertController(title: "Info:", message: "All data have to be filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false;
            }
    }
    
    @IBAction private func registrationButtonPressed(sender: UIButton){
        
        if(didFillRegistration() == true){
            
            //save in db
            newUser.userLogin = login.text
            newUser.userPassword = password.text
            newUser.email = email.text
            
            guard let userName = newUser.userLogin,
                let userPassword = newUser.userPassword,
                let userEmail = newUser.email
                else {
                    print("Saving users before filled all user info")
                    return
            }
            coreDataManager.saveUser(login: userName, password: userPassword, email: userEmail)
            
            
            //next VC
            guard let loginController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
            let navigationController = UINavigationController(rootViewController: loginController)
            present(navigationController, animated: true, completion: nil)        }
        
    }
    
    
    func ValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
    

}
