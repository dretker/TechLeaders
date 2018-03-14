//
//  CardStruct.swift
//  CardWallet
//
//  Created by Ania Kuliś on 22.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation
import UIKit

struct Card {
    
    let name: String
    let number: String
    let image: UIImage
    
    init(name: String, number: String, image: UIImage){
        self.name = name
        self.number = number
        self.image = image
    }
    
/*    init(name: String) {
        self.name = name
        self.number = UUID().hashValue
    }*/
    
}
