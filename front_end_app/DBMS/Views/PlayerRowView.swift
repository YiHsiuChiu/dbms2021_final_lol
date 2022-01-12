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
            CircleImageView(image: base64toImage(imageBase64String: player.image), size: 80).padding()
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

private func base64toImage(imageBase64String: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: imageBase64String, options: .ignoreUnknownCharacters) else {
        return nil
    }
    
    return UIImage(data: imageData)
}
