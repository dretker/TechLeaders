//
//  HomeViewController.swift
//  CardWallet
//
//  Created by Ania Kuliś on 18.12.2017.
//  Copyright © 2017 Ania Kulis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
  //  var cards : [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
/*
    func insertCard(){
        cards.append(newCard.text!)
        let index = IndexPath(row:cards.count-1, section:0)
        table.beginUpdates()
        table.insertRows(at: [indexPath], with: .automatic)
        table.endUpdates()
        
        newCard.text = ""
        view.endEditing(true)
        
    } */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
