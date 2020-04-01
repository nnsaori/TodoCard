//
//  TaskModel.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI
import Combine

enum TaskColor: Int, CaseIterable {
    case pink = 1
    case orange = 2
    case blue = 3

    var color: Color {
        switch self {
        case .pink:
            return Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))

        case .blue:
            return Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))

        default:
            return Color(#colorLiteral(red: 0.4389874041, green: 0.8469871879, blue: 0.7027612329, alpha: 1))
        }
    }
}

struct TaskModel: Hashable, Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var description: String?
    var date: String = ""
    var scheduledDate: Date?
    var color: Int?
}
