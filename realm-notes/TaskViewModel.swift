//
//  TaskViewModel.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(task: "Exercise in the morning", completed: false),
        Task(task: "Breakfast", completed: false),
        Task(task: "Take a shower", completed: false),
        Task(task: "Prepare for work", completed: false)
    ]
    
    @Published var completed: Bool = false
}
