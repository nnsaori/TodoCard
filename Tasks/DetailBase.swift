//
//  DetailBase.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailBase: View {
    var taskModel: TaskModel
    var body: some View {
        Text(taskModel.name)
    }
}

struct DetailBase_Previews: PreviewProvider {
    static var previews: some View {
        DetailBase(taskModel: Service().taskData[0])
    }
}
