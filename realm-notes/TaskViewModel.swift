//
//  TaskViewModel.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import Foundation
import RealmSwift

class TaskViewModel: ObservableObject {
    
    @ObservedResults(Task.self) var task
    @Published var tasks: [Task] = []
    @Published var showAddAlert: Bool = false
    @Published var taskTitle: String = ""
    
    var localRealm: Realm?

    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addTask(taskTitle: String) {
        if !taskTitle.isEmpty {
            let newTask = Task(task: taskTitle)
            $task.append(newTask)
        }
    }
        
    func markCompleted(item: Task, completed: Bool) {
        let realm = try! Realm()
        try! realm.write({
            item.thaw()?.completed = !item.completed
        })
    }
    
}
