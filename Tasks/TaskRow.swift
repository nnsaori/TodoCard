//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    var taskModel: TaskModel

    var body: some View {
        HStack {
            Text(taskModel.name)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRow(taskModel: taskModelData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
