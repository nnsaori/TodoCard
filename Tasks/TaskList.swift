//
//  TaskList.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskList: View {
    @State var taskData = Service().sortbyDate()

    var body: some View {
        NavigationView {
            List(taskData) { task in
                NavigationLink(destination: DetailBase(taskModel: task)) {
                    TaskRow(taskModel: task)
                }
            }
            .navigationBarTitle(Text("TASK LIST"))
            .navigationBarItems(trailing: Button(action: appendCard, label: {Text("+")}))
        }
    }

    func appendCard() {
        let maxId = (taskData.map{ $0.id }.max() ?? 0) + 1
        let task = TaskModel(id: maxId, name: "new task \(maxId)", date: Date())
        taskData.append(task)
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
