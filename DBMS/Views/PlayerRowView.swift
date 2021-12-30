//
//  PlayerRowView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI

struct PlayerRowView: View {
    var player: PlayerProfile
    var body: some View {
        HStack {
            CircleImageView(imageName: player.image, size: 80).padding()
            Text(player.name).bold().font(.callout).font(.system(size: 60))
            Spacer()
        }.frame(height: 100)
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: .demoplayer).previewLayout(.fixed(width: 320, height: 100))
    }
}
