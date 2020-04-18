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
            return Color(#colorLiteral(red: 0.262745098, green: 0.2549019608, blue: 0.4588235294, alpha: 1))

        case .orange:
            return Color(#colorLiteral(red: 0.8117647059, green: 0.4862745098, blue: 0.4941176471, alpha: 1))

        case .blue:
            return Color(#colorLiteral(red: 0.9058823529, green: 0.6470588235, blue: 0.4784313725, alpha: 1))
        }
    }
}

struct TaskModel: Hashable, Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var description = ""
    var date: String = ""
    var scheduledDate: Date?
    var color: Int = 1
}

struct ListState {
    var cards: [TaskModel]
    var activeIndex: Int
}
