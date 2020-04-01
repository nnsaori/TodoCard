//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    @State var taskModel = TaskModel()

    var body: some View {
        HStack {
            VStack {
                Text(taskModel.name)
                Text(taskModel.date!.string()).padding(.top, 5)
                Text(String(taskModel.date!.elapsedDays(date: taskModel.scheduledDate))).padding(.top, 5)
            }
            Spacer()

            Image(systemName: "xmark")
                .frame(width: 36, height: 36)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    self.doneCard()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 60, height: 200)
        .background(self.intToColor(raw: taskModel.color))
        .cornerRadius(20)
    }

    func doneCard() {
        taskModel.date = Date()
    }

    func intToColor(raw: Int?) -> Color {
        guard let color = raw else {
            #warning("TODO: force unwrapping")
            return TaskColor(rawValue: 1)!.color
        }

        #warning("TODO: force unwrapping")
        return TaskColor(rawValue: color)!.color
    }

}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRow(taskModel: data[0])
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
