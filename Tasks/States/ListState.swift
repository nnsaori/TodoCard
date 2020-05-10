//
//  ListState.swift
//  Tasks
//
//  Created by saori on 2020/05/05.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI
import Combine

struct ListState {
    var cards: [TaskModel]
    var activeIndex: Int

    var notification: UserNotificationCenterManager
}
