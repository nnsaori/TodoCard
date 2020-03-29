//
//  DetailContent.swift
//  Tasks
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailContent: View {
    var body: some View {
        Text(taskModelData[0].name)
    }

}

struct DetailContent_Previews: PreviewProvider {
    static var previews: some View {
        DetailContent()
    }
}
