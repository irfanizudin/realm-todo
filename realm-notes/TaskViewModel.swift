//
//  TaskViewModel.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import Foundation
import RealmSwift

class TaskViewModel: ObservableObject {
    
//    @Published var tasks: [Task] = [
//        Task(task: "Exercise in the morning", completed: false),
//        Task(task: "Breakfast", completed: false),
//        Task(task: "Take a shower", completed: false),
//        Task(task: "Prepare for work", completed: false)
//    ]
        
    @Published private(set) var tasks: [Task] = []
    @Published var completed: Bool = false
    @Published var showAddAlert: Bool = false
    @Published var taskTitle: String = ""
    
    private(set) var localRealm: Realm?

    init() {
        openRealm()
        getTask()
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
        guard let localRealm = localRealm else { return }
        do {
            let newTask = Task(task: taskTitle)
            try localRealm.write({
                localRealm.add(newTask)
                getTask()
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getTask() {
        guard let localRealm = localRealm else { return }
        let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed", ascending: true)
        tasks = []
        allTasks.forEach { [weak self] task in
            DispatchQueue.main.async {
                self?.tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        guard let localRealm = localRealm else { return }
        do {
            let taskToUpdate = localRealm.objects(Task.self).where({ $0.id == id })
            guard !taskToUpdate.isEmpty else { return }
            try localRealm.write({
                taskToUpdate.first?.completed = completed
                getTask()
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteTask(id: ObjectId) {
        guard let localRealm = localRealm else { return }
        do {
            let taskToDelete = localRealm.objects(Task.self).where({ $0.id == id })
            guard !taskToDelete.isEmpty else { return }
            try localRealm.write({
                localRealm.delete(taskToDelete)
                getTask()
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func markCompleted(item: Task, completed: Bool) {
        item.completed = completed
    }
    
}
