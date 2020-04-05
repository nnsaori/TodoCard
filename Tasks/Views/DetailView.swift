//
//  DetailView.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var service: Service
    @State var model: TaskModel

    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)

            VStack {
                HStack {
                    ForEach(TaskColor.allCases, id: \.self) { color in
                        Button(action: {
                            self.editColor(color: color)
                        }) {
                            HStack {
                                if self.getIndex() != nil {
//                                if self.service.taskData.count - 1 >= self.index {
                                    Text(color.rawValue == self.model.color ? "◯" : "")
                                        .font(.system(size: 45, weight: .bold))
                                        .frame(width: 50, height: 50)
                                        .background(color.color)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }

                if getIndex() != nil {
                    TKTextView(placeholderString: "DESCRIPTION..", text: $service.taskData[getIndex()!].description)
                            .frame(numLines: 5)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 15)
                            .padding(.trailing, 20)
                }
            }
            .padding(.horizontal, 10)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .systemThinMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
    }

    func getIndex() -> Int? {
        let index = self.service.taskData.firstIndex(where: { $0.id == model.id })
        return index
    }

    func editColor(color: TaskColor) {
        guard let index = self.service.taskData.firstIndex(where: { $0.id == model.id }) else  {
            return
        }
        self.service.taskData[index].color = color.rawValue
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(presenter: nil, service: Service())
//    }
//}
