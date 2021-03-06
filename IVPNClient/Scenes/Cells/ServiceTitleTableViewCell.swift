//
//  ServiceTitleTableViewCell.swift
//  IVPNClient
//
//  Created by Juraj Hilje on 27/04/2020.
//  Copyright © 2020 IVPN. All rights reserved.
//

import UIKit

class ServiceTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    var service: Service! {
        didSet {
            titleLabel.text = "IVPN \(service.typeText.uppercased())"
        }
    }
    
}
