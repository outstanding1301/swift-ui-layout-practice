//
//  MyList.swift
//  LayoutPractice
//
//  Created by 송인걸 on 2021/04/09.
//

import SwiftUI

struct MyList: View {
    
    @Binding
    var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        List {
            Section(header: Text("오늘 할 일")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/),
                    footer: Text("오늘 할 일 끝")) {
                ForEach(1...3, id: \.self) { index in
                    MyBasicCard("book.fill", "책읽기 \(index)", "11:00 - 12:00", Color.purple)
                    
                }
            }
            .listRowInsets(EdgeInsets.init(top: 3, leading: 10, bottom: 3, trailing: 10))
            Section(header: Text("내일 할 일")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/),
                    footer: Text("내일 할 일 끝")) {
                ForEach(1...5, id: \.self) { index in
                    MyBasicCard("book.fill", "책읽기 \(index)", "11:00 - 12:00", Color.red)
                    
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("내 목록")
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
