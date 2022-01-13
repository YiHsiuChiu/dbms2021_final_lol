//
//  TabBarView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct TabBarView: View {
    @State var tabIndex = 4 //for button click
    var body: some View {
        TabView {
            //Jump to another page set
            //Q:希望可以改成登入後不用Navigation方式跳到這頁，不然上面會有bar
            HomeView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            PlayerListView().tabItem {
                Image(systemName: "person")
                Text("Player")
            }
            TeamListView().tabItem {
                Image(systemName: "person.3.fill")
                Text("Team") 
            }
            GameListView().tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Game")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
