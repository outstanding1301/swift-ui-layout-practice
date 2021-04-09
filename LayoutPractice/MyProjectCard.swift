//
//  MyProjectCard.swift
//  LayoutPractice
//
//  Created by 송인걸 on 2021/04/09.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State
    var shouldShowAlert: Bool = false
    
    private var title: String
    private var period: String
    
    init(_ title: String, _ period: String) {
        self.title = title
        self.period = period
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(title)")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("\(period)")
                .foregroundColor(.secondary)
            Spacer().frame(height: 20)
            HStack {
                CircleImageView("kitten", activated: true)
                CircleImageView("original")
                CircleImageView("shower")
                
                Spacer()
                Button(action: {
                    self.shouldShowAlert = true
                }){
                    Text("확인")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창 띄우기"))
                }
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard("프로젝트", "10:00 - 11:00")
    }
}
