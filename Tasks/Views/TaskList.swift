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
    @State var card = TaskModel()
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
                    if !selectedCard {
                        Button(action: appendCard, label: {Image(systemName: "xmark")})
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 30)
                            .padding(.top, 30)
                    }

                    ForEach(service.taskData, id: \.self) { model in
                        GeometryReader { geometry in
                            TaskRow(service: self.service, model: model,
                                    active: (self.activeIndex == self.service.taskData.firstIndex(of: model)  && self.selectedCard))
                                .offset(y: self.activeIndex == self.service.taskData.firstIndex(of: model) && self.selectedCard ? -(geometry.frame(in: .global).minY - 150) : 0)
                                .scaleEffect((self.activeIndex == self.service.taskData.firstIndex(of: model) && self.selectedCard) ? 1.1 : 1)
                                .offset(x: self.activeIndex != self.service.taskData.firstIndex(of: model) && self.selectedCard ? UIScreen.main.bounds.width : 0)
                                .onTapGesture {
                                    self.activeIndex = self.service.taskData.firstIndex(of: model)!
                                    self.selectedCard = true
                            }
                            .frame(maxWidth: .infinity)
                            .gesture(
                                DragGesture().onChanged { value in
                                    self.viewState = value.translation
                                    self.selectedCard = true
                                    self.card = model
                                }
                                .onEnded { value in
                                    self.viewState = .zero
                                    self.selectedCard = false
                                }
                            )
                        }
                        .frame(height: 180)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }

            DetailView(service: service, index: activeIndex)
                .offset(x: 0, y: selectedCard ? 300 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: selectedCard ? 0 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.5))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -280
                        }
                        if self.bottomState.height < -280 {
                            self.bottomState.height = -280
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.selectedCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -280
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
        activeIndex = service.taskData.count - 1
        selectedCard = true
    }
}