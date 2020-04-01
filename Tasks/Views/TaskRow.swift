//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
//    @ObservedObject var servide: Service
    var model: TaskModel

    var body: some View {
        HStack {
            VStack {
                Text(model.name)
                Text(model.date).padding(.top, 5)
//                Text(String(taskModel.date.elapsedDays(date: taskModel.scheduledDate))).padding(.top, 5)
//                TextField("aaaaaa", text: $servide.taskData[0].date)
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
        .background(self.intToColor(raw: model.color ?? 0))
        .cornerRadius(20)
    }

    func doneCard() {
//        taskModel.date = "Date().string()"
    }

    func intToColor(raw: Int) -> Color {
        #warning("TODO: force unwrapping")
        return TaskColor(rawValue: raw)?.color ?? .white
    }

}

//struct TaskRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            TaskRow(taskModel: data[0])
//        }
//        .previewLayout(.fixed(width: 300, height: 300))
//    }
//}
