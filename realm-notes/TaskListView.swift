//
//  ListView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI
import RealmSwift

struct TaskListView: View {
    
    @ObservedResults(Task.self, sortDescriptor: .init(keyPath: "completed", ascending: true)) var tasks
    
    var body: some View {
        List {
            ForEach(tasks, id: \.id) { item in
                TaskRowView(items: item)
            }
            .onDelete(perform: $tasks.remove(atOffsets:))
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
