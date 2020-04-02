//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    @ObservedObject var service: Service
    var model: TaskModel
    var index: Int

    var body: some View {
        HStack(alignment: .top) {
            VStack() {
                Text(model.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 260, alignment: .leading)
                    .foregroundColor(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
                Spacer()
            }

            Image(systemName: "xmark")
                .frame(width: 36, height: 36)
                .background(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
                .cornerRadius(10)
                .padding(.leading, 30)
                .onTapGesture {
                    self.doneCard()
            }
        }
        .padding(.top, 10)
        .frame(width: UIScreen.main.bounds.width - 60, height: 180)
        .background(self.intToColor(raw: model.color ?? 0))
        .cornerRadius(10)
        .shadow(color: self.intToColor(raw: model.color ?? 0).opacity(0.3), radius: 20, x: 0, y: 20)
    }

    func doneCard() {
        service.taskData.remove(at: index)
        #warning("TODO: selectedIndex")
        service.selectedIndex = 0
    }

    func intToColor(raw: Int) -> Color {
        #warning("TODO: force unwrapping")
        return TaskColor(rawValue: raw)?.color ?? .white
    }
}

//struct TaskRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
////            TaskRow(model: data[0])
//        }
//        .previewLayout(.fixed(width: 500, height: 300))
//    }
//}
