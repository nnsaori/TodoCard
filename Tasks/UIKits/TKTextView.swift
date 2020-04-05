//
//  TKTextView.swift
//  Tasks
//
//  Created by saori on 2020/04/04.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TKTextView: UIViewRepresentable {
    typealias UIViewType = UITextView
    var placeholderString: String
    @Binding var text: String

    func makeUIView(context: UIViewRepresentableContext<TKTextView>) -> UITextView {
        let textView = UITextView()
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.backgroundColor = .clear
        textView.alpha = 1
        textView.font = UIFont(name: "AvenirNext-Bold", size: 40)
        textView.text = placeholderString
        textView.textColor = .placeholderText
        return textView
    }

    func updateUIView(_ textView: UITextView, context: UIViewRepresentableContext<TKTextView>) {
        if text != "" || textView.textColor != .placeholderText {
            textView.text = text
            textView.textColor = UIColor(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1))
        } else {
            textView.text = placeholderString
            textView.textColor = .placeholderText
        }
        textView.delegate = context.coordinator

    }

    func frame(numLines: CGFloat) -> some View {
        let height = UIFont(name: "AvenirNext-Bold", size: 40)!.lineHeight * numLines
        return self.frame(height: height)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension TKTextView {
    final class Coordinator: NSObject, UITextViewDelegate {
        private var textView: TKTextView

        init(_ textView: TKTextView) {
            self.textView = textView
        }

        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = UIColor(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1))
            }
        }

        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = self.textView.placeholderString
                textView.textColor = .placeholderText
            } else {
                self.textView.text = textView.text
            }
        }
    }
}
