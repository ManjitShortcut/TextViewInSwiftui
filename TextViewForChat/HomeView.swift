//
//  HomeView.swift
//  TextViewForChat
//
//  Created by Manjit on 01/06/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var  text: String = ""
    @State var  height: CGFloat = 40
    @State var  keyBoardheight: CGFloat = 0

    var body: some View {
        VStack {
            Text("TextView")
            Spacer()
            TextViewWrapper(text: $text, height: $height).frame(height:self.height).cornerRadius(5).padding().background(Color.red)
        }.background(Color.black.opacity(0.6)).edgesIgnoringSafeArea(.bottom).padding(.bottom,self.keyBoardheight).onAppear {
            self.addKeyboardNotification()
        }
    }
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (data) in
            
            let heigt1 = data.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            self.keyBoardheight = heigt1.cgRectValue.height-24
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
