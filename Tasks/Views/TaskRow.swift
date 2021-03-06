//
//  TaskRow.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    @EnvironmentObject var store: ListStore
    @State var model: TaskModel
    var active: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            if getIndex() != nil {
                TKTextView(placeholderString: "TITLE",
                           text: $store.state.cards[self.store.state.cards.firstIndex(where: {$0.id == model.id})!].name)
                    .frame(numLines: 3)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .disabled(!self.active)
            }

            if !self.active {
                Button(action: { self.doneCard() }, label: {
                    Image("done")
                    .foregroundColor(Color.white)
                })
                .frame(width: 40, height: 40)
                .background(BlurView(style: .systemThinMaterial))
                .cornerRadius(20)
                .padding(.trailing, 10)


//                VStack {
//                    Image(systemName: "xmark")
//                        .frame(width: 40, height: 40)
//                        .foregroundColor(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
//                        .onTapGesture {
//                            self.doneCard()
//                        }
//                }
//                .frame(width: 40, height: 40)
//                .background(Color.white)
//                .cornerRadius(20)
//                .padding(.trailing, 10)
            }
        }
        .padding(.top, 20)
        .frame(width: UIScreen.main.bounds.width - 60, height: 200)
        .background(self.intToColor(raw: model.color)
        .cornerRadius(10)
        .shadow(color: self.intToColor(raw: model.color).opacity(0.3), radius: 20, x: 0, y: 20))
    }

    func getIndex() -> Int? {
        return self.store.state.cards.firstIndex(where: {$0.id == model.id})
    }
    
    func doneCard() {
        store.dispatch(action: ListAction.remove(id: model.id))
    }

    func intToColor(raw: Int) -> Color {
        return TaskColor(rawValue: raw)!.color
    }
}
