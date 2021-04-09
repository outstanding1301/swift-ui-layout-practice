//
//  CircleImageView.swift
//  LayoutPractice
//
//  Created by 송인걸 on 2021/04/09.
//

import SwiftUI

struct CircleImageView: View {
    var imageName: String
    var activated: Bool
    
    init(_ imageName: String, activated: Bool = false) {
        self.imageName = imageName
        self.activated = activated
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(LinearGradient(gradient: Gradient(colors: [activated ? Color.red : Color.gray, activated ? Color.purple : Color.black]), startPoint: /*@START_MENU_TOKEN@*/.bottomLeading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.topTrailing/*@END_MENU_TOKEN@*/), lineWidth: 2)
            )
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView("kitten", activated: true)
    }
}
