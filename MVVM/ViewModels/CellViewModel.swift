//
//  CellViewModel.swift
//  MVVM
//
//  Created by Leonir (Pessoal) on 23/01/19.
//  Copyright © 2019 Leonir (Pessoal). All rights reserved.
//

import Foundation

struct CellViewModel {
    private var person: Person
    
    init(_ person: Person) {
        self.person = person
    }
    
    func labelValue() -> String {
        return "\(person.name) \(person.lastname)"
    }
}
