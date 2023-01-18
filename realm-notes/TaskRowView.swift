//
//  ListRowView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI
import RealmSwift

struct TaskRowView: View {
    
    @StateObject var vm = TaskViewModel()
    @ObservedRealmObject var items: Task
    
    var body: some View {
        HStack {
            Image(systemName: items.completed ? "checkmark.circle" : "circle")
                .foregroundColor(items.completed ? Color.accentColor : Color(UIColor.label))
            Text(items.task)
                .strikethrough(items.completed, color: items.completed ? Color.accentColor : Color(UIColor.label))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .onTapGesture {
            vm.markCompleted(item: items, completed: items.completed)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 10) {
            TaskRowView(items: Task())
        }
    }
}
