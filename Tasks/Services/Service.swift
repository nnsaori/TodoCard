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
    #warning("TODO: force unwrapping")
    let task = data.sorted { $0.date! < $1.date! }
    return task
}

class Service: ObservableObject {
    @Published var taskData: [TaskModel] = data

    init() {
    }
}
