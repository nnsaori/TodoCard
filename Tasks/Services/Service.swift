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

class Service: ObservableObject {
    @Published var taskData: [TaskModel] = sortbyDate()

    init() { }

    func appendNewTask() {
        let maxId = (self.taskData.map{ $0.id }.max() ?? 0) + 1
        let task = TaskModel(id: maxId, name: "", description: "", date: Date().string(), color: 1)
        self.taskData.insert(task, at: 0)
    }
}
