//
//  TKTextView.swift
//  Tasks
//
//  Created by saori on 2020/04/04.
//  Copyright © 2020 saori. All rights reserved.
//

import SwiftUI

struct TKTextView: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = UIColor.clear
        textView.alpha = 1
        textView.font = UIFont(name: "AvenirNext-Bold", size: 40)
        textView.textColor = UIColor(#colorLiteral(red: 0.2862745098, green: 0.3176470588, blue: 0.3490196078, alpha: 1))

        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
    }
}

extension TKTextView {
    final class Coordinator: NSObject, UITextViewDelegate {
        private var textView: TKTextView

        init(_ textView: TKTextView) {
            self.textView = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let currentText = textView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
            return updatedText.count <= 15
        }

        func textViewDidChange(_ textView: UITextView) {
            self.textView.text = textView.text
        }
    }
}
