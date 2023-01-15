//
//  ListRowView.swift
//  realm-notes
//
//  Created by Irfan Izudin on 14/01/23.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: String
    let completed: Bool
    
    var body: some View {
        HStack {
            Image(systemName: completed ? "checkmark.circle" : "circle")
                .foregroundColor(completed ? Color.accentColor : Color(UIColor.label))
            Text(task)
                .strikethrough(completed, color: completed ? Color.accentColor : Color(UIColor.label))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 10) {
            TaskRowView(task: "Exercise in the morning", completed: false)
            TaskRowView(task: "Exercise in the morning", completed: true)
        }
    }
}
