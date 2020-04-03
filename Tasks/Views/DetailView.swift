//
//  DetailView.swift
//  Tasks
//
//  Created by saori on 2020/03/30.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var service: Service
    var index: Int

    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            VStack {
                HStack {
                    ForEach(TaskColor.allCases, id: \.self) { color in
                        Button(action: {
                            if self.service.taskData.count - 1 >= self.index {
                                self.service.taskData[self.index].color = color.rawValue
                            }
                        }) {
                            HStack {
                                if self.service.taskData.count - 1 >= self.index {
                                    Text(color.rawValue == self.service.taskData[self.index].color ? "◯" : "")
                                        .font(.system(size: 45, weight: .bold))
                                        .frame(width: 50, height: 50)
                                        .background(color.color)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }

                if service.taskData.count - 1 >= index {
                    TextField("description", text: $service.taskData[index].description)
                        .padding(.top, 10)
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 20, alignment: .leading)
                        .foregroundColor(Color(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1)))
                        .lineLimit(10)
                }
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

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(presenter: nil, service: Service())
//    }
//}
