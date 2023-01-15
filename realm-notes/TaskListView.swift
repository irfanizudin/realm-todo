//
//  ListView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI

struct TaskListView: View {
        
    @StateObject var vm = TaskViewModel()
    
    var body: some View {
        List(vm.tasks, id: \.id) { item in
            TaskRowView(task: item.task, completed: item.completed)
                .onTapGesture {
                    print("firee \(item.task)")
                }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
