//
//  MyViewModel.swift
//  MVVM
//
//  Created by Leonir (Pessoal) on 23/01/19.
//  Copyright © 2019 Leonir (Pessoal). All rights reserved.
//

import Foundation

struct MyViewModel {
    
    let service: [String: String] = [
        "Leonir": "Deolindo",
        "João": "Das Coves"
    ]
    var data: [CellViewModel] = [] {
        didSet {
            self.updateList?()
        }
    }
    var updateList: (()->Void)?
    
    private mutating func fetchData() {
        data = service.map({ CellViewModel(Person(name: $0, lastname: $1)) })
    }
    
    mutating func numberRows() -> Int {
        fetchData()
        return data.count > 0 ? data.count : 0
    }
    
    func cellVM(index: Int) -> CellViewModel {
        return data[index]
    }
}
