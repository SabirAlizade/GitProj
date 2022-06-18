//
//  Extension.swift
//  GitProj
//
//  Created by Sabir Alizade on 18.06.2022.
//

import Foundation

extension UserDefaults {
    
    func saveTask(data: [TaskModel], key: String) {
        if let dataTask  = try? JSONEncoder().encode(data) {
            self.set(dataTask, forKey: key)
        }
    }
    
    func readTask(key: String) -> [TaskModel] {
        if let data = self.value(forKey: key) as? Data {
            if let decodeTask = try? JSONDecoder().decode([TaskModel].self, from : data) {
                return decodeTask
        }
    }
    return [TaskModel]()
}
    func removeTask(key: String) {
        self.removeObject(forKey: key)
        self.synchronize()
    }
}
