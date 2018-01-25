//
//  AddViewController.swift
//  CardWallet
//
//  Created by Ania Kuliś on 21.12.2017.
//  Copyright © 2017 Ania Kulis. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNr: UITextField!
    @IBOutlet weak var addButton: UIButton!
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        var secondVC = segue.destination as! HomeViewController
        secondVC.cards.append(cardName.text!)
    }
    
    
    @IBAction func addCardfunc(_ sender: Any) {
        
        if(cardName.text != "" && cardNr.text != ""){
            performSegue(withIdentifier: "segue", sender: self)
        }
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
