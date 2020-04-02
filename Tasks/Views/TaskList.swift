//
//  TaskList.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskList: View {
    @State private var selectedCard = false
    @State private var viewState = CGSize.zero
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    @State private var activeIndex = 0

    #warning("change to Model")
    @ObservedObject private var service: Service

    var presenter: TaskListPresenter?
    init(presenter: TaskListPresenter?, service: Service) {
        self.service = service
        self.presenter = presenter
    }
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: appendCard, label: {Text("+")})
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 30)
                        .padding(.top, 30)
                    ForEach(service.taskData.indices, id: \.self) { index in
                        TaskRow(service: self.service, model: self.service.taskData[index], index: index)
                            .onTapGesture {
                                #warning("selectedIndex消す")
                                self.service.selectedIndex = index
                                self.activeIndex = index
                                self.selectedCard = true
                        }
                        .gesture(
                            DragGesture().onChanged { value in
                                self.viewState = value.translation
                                self.selectedCard = true
                            }
                            .onEnded { value in
                                self.viewState = .zero
                                self.selectedCard = false
                            }
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
            }

            DetailView(model: $service.taskData[activeIndex], service: service)
                .offset(x: 0, y: selectedCard ? 360 : 1000)
                    .offset(y: bottomState.height)
                    .blur(radius: selectedCard ? 0 : 0)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.selectedCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -300
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
                )
        }
        .onAppear(perform: presenter?.fetchTask)
    }

    func appendCard() {
        let maxId = (service.taskData.map{ $0.id }.max() ?? 0) + 1
        let task = TaskModel(id: maxId, name: "new task \(maxId)", date: Date().string())
        service.taskData.append(task)
    }
    func select() {

    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList(presenter: nil, service: Service())
    }
}
