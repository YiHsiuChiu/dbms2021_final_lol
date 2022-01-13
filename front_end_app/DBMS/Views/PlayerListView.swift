//
//  PlayerListView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI

struct PlayerListView: View {
    @State private var searchText = ""
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                List(playerData.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { player in
                    NavigationLink (
                        destination: PlayerView(player: player)) {
                            PlayerRowView(player: player)
                        }
                    }.navigationBarTitle(Text("Player List"))
                }.searchable(text: $searchText)
        }
    }
    
    struct PlayerList: Decodable {
        var playerid:String
        var team:String
        var name:String
        var role:String
        var mvpNum:String
        var image:String
    }
}



struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
