//
//  DetailView.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var store: ListStore
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
                    TKTextView(placeholderString: "DESCRIPTION..",
                               text: $store.state.cards[self.store.state.cards.firstIndex(where: {$0.id == model.id})!].description)
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
        return self.store.state.cards.firstIndex(where: {$0.id == model.id})
    }

    func editColor(color: TaskColor) {
        self.store.dispatch(action: ListAction.editColor(value: color))
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(presenter: nil, service: Service())
//    }
//}
