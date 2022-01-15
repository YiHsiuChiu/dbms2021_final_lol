//
//  TeamListView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI

struct TeamListView: View {
    @State private var searchText = ""
    init() {
        teamData = getTeamList()
    }
    var body: some View {
        if #available(iOS 15.0, *) {
        NavigationView {
            
            List(teamData.filter({ searchText.isEmpty ? true : $0.teamName.contains(searchText) })) { team in
                NavigationLink (
                    destination: TeamView(team: team)) {
                    TeamRowView(team: team)
                    }
                }.navigationBarTitle(Text("Team List"))
            }
            .searchable(text: $searchText)
        }
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView()
    }
}
