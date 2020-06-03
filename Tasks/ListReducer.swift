//
//  Reducer.swift
//  Tasks
//
//  Created by saori on 2020/04/12.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation
import SwiftUI
import ReSwift

struct ListReducer {
    static func reduce(action: Action, state: ListState) -> ListState {

        switch action {

        case let listAction as ListAction:
            return reduce(action: listAction, state: state)

        default:
            break
        }

        return state
    }


    static func reduce(action: ListAction, state: ListState) -> ListState {
        var state = state

        switch action {
        case .fetch:
            state.cards = data.sorted { $0.date < $1.date }
            return state

        case .add:
            let maxId = (state.cards.map{ $0.id }.max() ?? 0) + 1
            let task = TaskModel(id: maxId, name: "", description: "", date: Date().string(), color: 1)
            state.cards.append(task)
            state.activeIndex = maxId

            state.notification.setup(model: task)
            return state

        case .detailViewWillClose(let model):
            state.notification.addScheduleNotification(model: model)
            return state

        case .select(let model):
            guard let index = state.cards.firstIndex(of: model) else {
                return state
            }
            state.activeIndex = index
            return state

        case .editTitle(let title):
            state.cards[state.activeIndex].name = title
            return state

        case .editColor(let color):
            state.cards[state.activeIndex].color = color.rawValue
            return state

        case .remove(let id):
            state.cards.removeAll(where: { $0.id == id })
            return state
        }
    }
}
