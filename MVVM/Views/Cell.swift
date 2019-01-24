//
//  Cell.swift
//  MVVM
//
//  Created by Leonir (Pessoal) on 23/01/19.
//  Copyright © 2019 Leonir (Pessoal). All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    func setup(_ vm: CellViewModel) {
        self.textLabel?.text = vm.labelValue()
    }
}
