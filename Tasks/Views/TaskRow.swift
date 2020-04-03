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
    @State var model: TaskModel
    var active: Bool = false

    var body: some View {
        HStack(alignment: .top) {
            if getIndex() != nil {
                TextField("Title", text: $service.taskData[getIndex()!].name)
                    .position(x: 100, y: 10)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .frame(width: 260, alignment: .leading)
                    .foregroundColor(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
                    .disabled(!self.active)
            }

            if !self.active {
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
                    .padding(.leading, 30)
                    .onTapGesture {
                        self.doneCard()
                    }
            }
//            Text("\(self.index) + \((self.service.taskData.count - 1 >= self.index).description)")
        }
        .padding(.top, 10)
        .frame(width: UIScreen.main.bounds.width - 60, height: 180)
        .background(self.intToColor(raw: model.color)
        .cornerRadius(10)
        .shadow(color: self.intToColor(raw: model.color).opacity(0.3), radius: 20, x: 0, y: 20))
    }

    func getIndex() -> Int? {
        return self.service.taskData.firstIndex(where: {$0.id == model.id})
    }
    func doneCard() {
        guard let index = getIndex() else {
            return
        }
        self.service.taskData.removeAll(where: { $0.id == self.service.taskData[index].id})
    }

    func intToColor(raw: Int) -> Color {
        return TaskColor(rawValue: raw)?.color ?? .white
    }
}
