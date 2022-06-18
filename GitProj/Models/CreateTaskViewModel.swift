//
//  CreateTaskViewModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 16.06.2022.
//

import Foundation

class CreateTaskViewModel {
    
    
    private var id: String = ""
    var taskId: String {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
}
