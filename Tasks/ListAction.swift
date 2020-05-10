//
//  ListAction.swift
//  Tasks
//
//  Created by saori on 2020/04/13.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation
import ReSwift

enum ListAction: Action {
    case fetch
    case add
    case detailViewWillClose(model: TaskModel)
    case select(model: TaskModel)
    case remove(id: Int)
    case editTitle(value: String)
    case editColor(value: TaskColor)
}

