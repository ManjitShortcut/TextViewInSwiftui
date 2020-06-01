//
//  TextViewWrapper.swift
//  TextViewForChat
//
//  Created by Manjit on 01/06/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation
import SwiftUI

struct TextViewWrapper: UIViewRepresentable {
    
    @Binding var text : String
    @Binding var height : CGFloat
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.text = "Entre Message"
        textView.font = .systemFont(ofSize: 19)
        textView.textColor = UIColor.gray
        textView.delegate = context.coordinator
        return textView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        DispatchQueue.main.async {
            self.height = uiView.contentSize.height
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewWrapper
        init(parent: TextViewWrapper) {
            self.parent = parent
        }
        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.parent.height = textView.contentSize.height
            }
        }
        
    }
    
}
