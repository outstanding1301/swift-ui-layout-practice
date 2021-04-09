//
//  ContentView.swift
//  LayoutPractice
//
//  Created by 송인걸 on 2021/04/09.
//

import SwiftUI

struct ContentView: View {
    @State
    private var isNavigationBarHidden: Bool = false
    
    let basicCards = [
        ["pencil", "글쓰기", "10:00 - 11:00"],
        ["paperplane.fill", "메일 보내기", "11:00 - 12:00"],
        ["swift", "스위프트 공부", "12:00 - 13:00"],
        ["powersleep", "낮잠", "13:00 - 15:00"],
        ["flame.fill", "일하기", "15:00 - 19:00"],
        ["gamecontroller.fill", "게임하기", "19:00 - 23:59"],
    ]
    
    private let backgrounds = [
        Color.green,
        Color.orange,
        Color.purple,
        Color.blue,
        Color.pink
    ]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    VStack(alignment: .leading) {
                        Rectangle().frame(height: 0)
                        HStack {
                            NavigationLink(destination: MyList()) {
                                Image(systemName: "square.grid.2x2.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 40))
                        }
                        Spacer()
                            .frame(height: 10.0)
                        Text("할 일 목록")
                            .font(.system(size: 40))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }.padding(.horizontal, 10.0)
                    .padding(.bottom, 5)
                    ScrollView {
                        VStack {
                            MyProjectCard("프로젝트", "10:00 - 11:00")
                                ForEach(basicCards.indices, id: \.self) { index in
                                        MyBasicCard(basicCards[index][0], basicCards[index][1], basicCards[index][2],
                                                    backgrounds[index % backgrounds.count])
                            }
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                }
                
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 20)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }.navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
