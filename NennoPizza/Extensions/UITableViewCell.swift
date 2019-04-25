//
//  UITableViewCell.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
