//
//  PlayerView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct PlayerView: View {
    var player: PlayerProfile
    
    var body: some View {
        VStack {
            Spacer()
            CircleImageView(image: base64toImage(imageBase64String: player.image), size: 200).padding()
            Spacer()
            Divider()
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("ID: ").font(.system(size: 20)).bold()
                    Spacer()
                    Text(player.playerid).font(.callout).font(.system(size: 60)).bold()
                }.padding()
                Divider()
                HStack {
                    Text("Team: ").font(.system(size: 20)).bold()
                    Spacer()
                    Spacer()
                    Text(player.team).font(.callout).font(.system(size: 60)).bold()
                }.padding()
                Divider()
                HStack {
                    Text("Name: ").font(.system(size: 20)).bold()
                    Spacer()
                    Spacer()
                    Text(player.name).font(.callout).font(.system(size: 60)).bold()
                }.padding()
                Divider()
                HStack {
                    Text("Role: ").font(.system(size: 20)).bold()
                    Spacer()
                    Spacer()
                    Text(player.role).font(.callout).font(.system(size: 60)).bold()
                }.padding()
                Divider()
                HStack {
                    Text("Mvp次數: ").font(.system(size: 20)).bold()
                    Spacer()
                    Spacer()
                    Text(player.mvpNum).font(.callout).font(.system(size: 60)).bold()
                }.padding()
                Divider()
            }
            Spacer()
            Spacer()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: .demoplayer)
    }
}

// private func base64toImage(imageBase64String: String) -> UIImage? {
//     guard let imageData = Data(base64Encoded: imageBase64String, options: .ignoreUnknownCharacters) else {
//         return nil
//     }
    
//     return UIImage(data: imageData)
// }
