//
//  DetailView.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject private var service: Service
    var presenter: DetailPresenter?

    init(presenter: DetailPresenter?, service: Service) {
        self.presenter = presenter
        self.service = service
    }

    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            VStack {
                HStack {
                    ForEach(TaskColor.allCases, id: \.self) { color in
                        Text(color.rawValue == self.service.lastSelectedTask?.color ? "1" : "")
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(color.color)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.presenter?.tappedColor(color: TaskColor(rawValue: color.rawValue))
                        }
                    }
                }
//                TextField("Date", text: service.lastSelectedTask.name)
                Text(self.service.lastSelectedTask?.name ?? "")
                    .fontWeight(.bold)
                    .padding(.top, 10)
                Text(self.service.lastSelectedTask?.date?.string() ?? "")
                    .fontWeight(.bold)
                    .padding(.top, 10)
                Text(self.service.lastSelectedTask?.scheduledDate?.string() ?? "")
                    .fontWeight(.bold)
                    .padding(.top, 10)
            }
            .padding(.horizontal, 10)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .systemThinMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(presenter: nil, service: Service())
    }
}
