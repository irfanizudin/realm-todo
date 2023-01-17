//
//  Task.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var task: String
    @Persisted var completed: Bool = false
    
    convenience init(task: String) {
        self.init()
        self.task = task
    }
}


