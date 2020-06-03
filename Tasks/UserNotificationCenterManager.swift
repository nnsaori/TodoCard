//
//  UserNotificationCenterManager.swift
//  Tasks
//
//  Created by saori on 2020/05/04.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation
import UserNotifications

class UserNotificationCenterManager: NSObject {

    func setup(model: TaskModel) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] (granted, error) in
            guard let strongSelf = self else { return }
            if !granted { return }

            strongSelf.addScheduleNotification(model: model)
        }
    }

    func addScheduleNotification(model: TaskModel) {
print("addScheduleNotification \(model.description)")
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.title = model.name
        content.body = model.description
        content.userInfo = ["data": ["id" : model.id]]

        var dateComponents = DateComponents()
        dateComponents.second =  5
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error! UNUserNotificationCenter.add :\(String(describing: error.localizedDescription))")
            }
        }
    }
}
