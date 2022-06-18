//
//  UpdateViewModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 16.06.2022.
//

import Foundation

protocol UpdateProtocol {
    func update(note: String, index: Int)
    
}

class UpdateViewModel {
    var delegate: UpdateProtocol?
    
    private var id: String = ""
    var taskId: String {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
    
    var selectedIndex: Int = 0
    
    func updateData(note: String) {
        self.delegate?.update(note: note, index: selectedIndex)
    }
}
