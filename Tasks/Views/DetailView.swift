//
//  DetailView.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    @Binding var model: TaskModel
    @ObservedObject var service: Service

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
                            self.service.taskData[self.service.selectedIndex].color = color.rawValue
                        }) {
                            HStack {
                                Text(color.rawValue == self.model.color ? "●" : "")
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(width: 36, height: 36)
                                    .background(color.color)
                                    .clipShape(Circle())
                            }
                        }
//                        Text(color.rawValue == self.model.color ? "●" : "")
//                            .font(.system(size: 16, weight: .medium))
//                            .frame(width: 36, height: 36)
//                            .background(color.color)
//                            .clipShape(Circle())
//                            .onTapGesture {
//                                self.editDate(type: color)
//                        }
                    }
                }

                TextField("name", text: $model.name).padding(.top, 10)
//                    .fontWeight(.bold)
//                    .padding(.top, 10)
                TextField("date", text: $model.date)
                Text(model.scheduledDate?.string() ?? "")
                    .fontWeight(.bold)
                    .padding(.top, 10)
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

    func editDate(type: TaskColor) {
//        self._model.color = type.rawValue
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(presenter: nil, service: Service())
//    }
//}
