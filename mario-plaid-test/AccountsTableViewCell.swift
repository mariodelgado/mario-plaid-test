//
//  AccountsTableViewCell.swift
//  mario-plaid-test
//
//  Created by Mario Delgado on 2/5/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountDesc: UILabel!
    @IBOutlet weak var accountValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
