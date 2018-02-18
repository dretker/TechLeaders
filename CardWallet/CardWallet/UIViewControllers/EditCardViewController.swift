//
//  EditCardViewController.swift
//  CardWallet
//
//  Created by Ania Kuliś on 15.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

class EditCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        
        let dismissButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(didTapDismissButton(_:)))
        navigationItem.leftBarButtonItem = dismissButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @objc func didTapDismissButton(_ button: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
