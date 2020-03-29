//
//  TaskList.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskList: View {

    var body: some View {
        NavigationView {
            List(taskModelData) { task in
                NavigationLink(destination: DetailBase(taskModel: task)) {
                    TaskRow(taskModel: task)
                }
            }
            .navigationBarTitle(Text("TASK LIST"))
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
