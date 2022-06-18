//
//  MainViewModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation

class MainViewModel {

    private let password: String = "anykey"
    let userDefault = UserDefaults.standard
    var data: [TaskModel] = []
    var mainTask: [MainTask] = []
    
    func addData(name: String) {
        mainTask.append((MainTask(id: UUID(), name: name, isActive: false)))
    }
    
    func saveData() {
        userDefault.saveTask(data: self.data, key: password)
    }
    
    func readData() -> [TaskModel] {
        return userDefault.readTask(key: password)
    }
}
