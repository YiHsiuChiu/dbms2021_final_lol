//
//  TeamView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct TeamView: View {
    var team: TeamProfile
    
    var body: some View {
            VStack {
                Spacer()
                CircleImageView(image: base64toImage(imageBase64String: team.image), size: 200).padding()
                Spacer()
                Divider()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Team Name: ").font(.system(size: 20)).bold()
                        Spacer()
                        Spacer()
                        Text(team.teamName).font(.callout).font(.system(size: 60)).bold()
                    }.padding()
                    Divider()
                    Text("Current Member: ").font(.system(size: 20)).bold().padding()
                        List(playerData) {
                            player in
                            NavigationLink (
                                destination: PlayerView(player: player)) {
                                PlayerRowView(player: player)
                            }
                        }
                    //Team要撈同隊選手ㄉ資料
                }
                Spacer()
                Spacer()
            }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(team: .demoteam)
    }
}

private func base64toImage(imageBase64String: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: imageBase64String, options: .ignoreUnknownCharacters) else {
        return nil
    }
    
    return UIImage(data: imageData)
}
