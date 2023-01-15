//
//  ContentView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = TaskViewModel()
    
    var body: some View {
        NavigationView {
            TaskListView()
                .navigationTitle("Realm To Do")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Text("\(vm.tasks.count) Task Remaining")
                            .foregroundColor(Color.accentColor)
                        Spacer()
                        Button {
                            //add new task
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
