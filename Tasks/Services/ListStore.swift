//
//  ListStore.swift
//  Tasks
//
//  Created by saori on 2020/04/13.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI
import Combine
import ReSwift

final class ListStore: ObservableObject {
    @Published var state: ListState
    @Published private(set) var selectedId: Int

    init(state: ListState = .init(cards: [], activeIndex: -1)) {
        self.state = state
        selectedId = -1
    }

    func dispatch(action: Action) {
        state = ListReducer.reduce(action: action, state: state)
    }
}
