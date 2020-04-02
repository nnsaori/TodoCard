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
            return Color(#colorLiteral(red: 0.9803921569, green: 0.7882352941, blue: 0.7215686275, alpha: 1))

        case .blue:
            return Color(#colorLiteral(red: 0.8980392157, green: 0.831372549, blue: 0.7529411765, alpha: 1))

        default:
            return Color(#colorLiteral(red: 0.7725490196, green: 0.8705882353, blue: 0.8039215686, alpha: 1))
        }
    }
}

struct TaskModel: Hashable, Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var description = ""
    var date: String = ""
    var scheduledDate: Date?
    var color: Int?
}
