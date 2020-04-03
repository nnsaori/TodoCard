//
//  Service.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI
import Combine

func sortbyDate() -> [TaskModel] {
    let list = data.sorted { $0.date < $1.date }
    return list
}

func selectedModel() -> [TaskModel] {
    let list = data.sorted { $0.date < $1.date }
    return list
}

class Service: ObservableObject {
    @Published var taskData: [TaskModel] = sortbyDate()

    init() {
    }
}
