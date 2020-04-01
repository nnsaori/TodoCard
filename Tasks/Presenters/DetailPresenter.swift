//
//  DetailPresenter.swift
//  Tasks
//
//  Created by saori on 2020/03/31.
//  Copyright © 2020 saori. All rights reserved.
//

import UIKit

protocol DetailPresenterProtocol {
    func tappedColor(color: TaskColor?)
}

class DetailPresenter: DetailPresenterProtocol {
    private var service: Service

    init(service: Service) {
        self.service = service
    }

    func tappedColor(color: TaskColor?) {
//        service.lastSelectedTask.color = color?.rawValue
    }
}
