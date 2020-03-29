//
//  TaskModel.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TaskModel: Hashable, Codable, Identifiable {
        var id: Int
        var name: String
        var date: Date
}
