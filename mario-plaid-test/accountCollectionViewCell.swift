//
//  accountCollectionViewCell.swift
//  mario-plaid-test
//
//  Created by Mario Delgado on 1/29/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit
import SwiftyJSON

class accountCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var accountName: UILabel!
    
    var data:JSON?{
        didSet{
            self.setupData()
        }
    }

    func setupData(){
        
        if let accountNameString = self.data?["accounts"]["meta"]["name"]{
            let name = NSURL(string: accountNameString.stringValue)
           // self.accountName.text(name!)
        }
        
    }

    
}
