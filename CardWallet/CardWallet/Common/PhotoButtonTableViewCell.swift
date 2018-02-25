//
//  PhotoButtonTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 03.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

class PhotoButtonTableViewCell: UITableViewCell {
    
    var onButtonTap: (() -> Void)?
    
    @IBAction func didTapButton(_ sender: Any) {
        onButtonTap?()
    }
    
}
