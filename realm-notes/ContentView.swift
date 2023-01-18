//
//  ContentView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @StateObject var vm = TaskViewModel()
    @ObservedResults(Task.self) var tasks

    var body: some View {
        NavigationView {
            TaskListView()
                .navigationTitle("Realm To Do")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Text("\(tasks.filter({$0.completed == false}).count) Task Remaining")
                            .foregroundColor(Color.accentColor)
                        Spacer()
                        Button {
                            vm.showAddAlert.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                }
                .alert("Add New Task", isPresented: $vm.showAddAlert) {
                    TextField("Write task here...", text: $vm.taskTitle)
                        .autocorrectionDisabled()
                    Button("Add", role: .none) {
                        vm.addTask(taskTitle: vm.taskTitle)
                        vm.taskTitle = ""
                    }
                    Button("Cancel", role: .cancel) {
                    }
                } message: {
                    Text("Add new taks below")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
