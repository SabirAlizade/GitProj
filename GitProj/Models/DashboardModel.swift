//
//  DashboardModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation

struct MainTask: Codable {
    var id: UUID
    var name: String
    var isActive: Bool = false
}

struct TaskDetails: Codable {
    var mainId: String
    var note: String
    var startDate: String
    var endDate: String
}
