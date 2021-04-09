//
//  MyBasicCard.swift
//  LayoutPractice
//
//  Created by 송인걸 on 2021/04/09.
//

import SwiftUI

struct MyBasicCard: View {
    
    private var icon: String
    private var title: String
    private var period: String
    private var color: Color
    
    init(_ icon: String, _ title: String, _ period: String, _ color: Color) {
        self.icon = icon
        self.title = title
        self.period = period
        self.color = color
    }
    
    var body: some View {
        HStack {
            Image(systemName: "\(icon)")
                .font(.system(size: 50))
                .frame(width: 80, height: 80)
                .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0) {
                Text("\(title)")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("\(period)")
                    .foregroundColor(.white)
                Rectangle().frame(height: 0)
            }
        }
        .padding(20)
        .background(color)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard("flag.fill", "Todo", "10:00 - 11:00", Color.purple)
    }
}
