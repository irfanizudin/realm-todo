//
//  Task.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: String = UUID().uuidString
    let task: String
    let completed: Bool
}


