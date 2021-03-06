//
//  GameListView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/30.
//

import SwiftUI

struct GameListView: View {
    @State private var searchText = ""
    @State private var list:[GameProfile] = []
    init() {
//        list = getGameList()
    }
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
            
                List(list.filter({ searchText.isEmpty ? true : $0.teamRedName.contains(searchText) })) { game in
                    NavigationLink (
                        destination: GameView(game: game)) {
                        GameRowView(game: game)
                        }
                    }.navigationBarTitle(Text("Game List"))
            }.searchable(text: $searchText).onAppear {
                list = getGameList()
            }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
