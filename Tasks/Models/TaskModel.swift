//
//  TaskModel.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct TaskModel: Hashable, Codable, Identifiable {
        var id: Int = -1
        var name: String = ""
        var date: Date?
}
