//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    @State var taskModel: TaskModel

    var body: some View {
        HStack {
            Text(taskModel.name)
            Spacer()
            Text("One").onTapGesture {
                self.doneCard()
            }
                .frame(width: 100)
                .padding(5)
                .background(Color(white: 0.9))
                .cornerRadius(10)
        }
    }
    func doneCard() {
        taskModel.date = Date()
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRow(taskModel: Service().taskData[1])
        }
        .previewLayout(.fixed(width: 300, height: 170))
    }
}