//
//  TaskModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation

struct TaskModel: Codable {
    let name: String
    let date: String
    var category: String? = nil
    var note: String? = nil
}

