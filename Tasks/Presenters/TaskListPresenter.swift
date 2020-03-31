//
//  TaskListPresenter.swift
//  Tasks
//
//  Created by saori on 2020/03/31.
//  Copyright © 2020 saori. All rights reserved.
//

import UIKit

protocol TaskListPresenterProtocol {
    func fetchTask()
    func addTask()
}

class TaskListPresenter: TaskListPresenterProtocol {
    private var service: Service

    init(service: Service) {
        self.service = service
    }

    func fetchTask() {
        self.service.taskData = sortbyDate()
    }

    func addTask() {
        print("debug: addTask")
    }


}
