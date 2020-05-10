//
//  TaskListView.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var store: ListStore

    @State private var selectedCard = false
    @State private var viewState = CGSize.zero
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    @State private var activeIndex = 0
    @State var lastModel: TaskModel?

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    if !selectedCard {
                        Button(action: addNewCard, label: { Image("plus") })
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 30)
                            .padding(.top, 30)
                    }

                    ForEach(store.state.cards, id: \.self) { model in
                        GeometryReader { geometry in
                            TaskRow(model: model, active: self.selectedCard && self.activeIndex == self.store.state.cards.firstIndex(of: model)).environmentObject(self.store)
                                .offset(y: self.activeIndex == self.store.state.cards.firstIndex(of: model) && self.selectedCard ? -(geometry.frame(in: .global).minY - 150) : 0)
                                .scaleEffect((self.activeIndex == self.store.state.cards.firstIndex(of: model) && self.selectedCard) ? 1.1 : 1)
                                .offset(x: self.activeIndex != self.store.state.cards.firstIndex(of: model) && self.selectedCard ? UIScreen.main.bounds.width : 0)
                                .onTapGesture {
                                    self.store.dispatch(action: ListAction.select(model: model))
                                    self.activeIndex = self.store.state.cards.firstIndex(of: model)!
                                    self.lastModel = model
                                    self.selectedCard = true
                            }
                            .frame(maxWidth: .infinity)
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
                        .frame(height: 200)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }

            ForEach(store.state.cards, id: \.self) { model in
                DetailView(model: model).environmentObject(self.store)
                    .offset(x: 0, y: self.selectedCard && self.activeIndex == self.store.state.cards.firstIndex(of: model) ? 300 : 1000)
                    .offset(y: self.bottomState.height)
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
                                if !self.showFull {
                                    UIApplication.shared.connectedScenes
                                    .filter({$0.activationState == .foregroundActive})
                                    .map({$0 as? UIWindowScene})
                                    .compactMap({$0})
                                    .first?.windows
                                        .filter({$0.isKeyWindow}).first?.endEditing(true)

                                    self.store.dispatch(action: ListAction.detailViewWillClose(model: self.store.state.cards[self.activeIndex]))
                                }
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
        }
        .onAppear {
            self.store.dispatch(action: ListAction.fetch)
        }
    }
    
    func addNewCard() {
        self.store.dispatch(action: ListAction.add)
        self.activeIndex = self.store.state.cards.count - 1
        selectedCard = true
    }
}
