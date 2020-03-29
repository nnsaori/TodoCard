//
//  Service.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation

class Service {
    var taskData = data
    func sortbyDate() -> [TaskModel] {
        let task = data.sorted { $0.date < $1.date }
        return task
    }
}
