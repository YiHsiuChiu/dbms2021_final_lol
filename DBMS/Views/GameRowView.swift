//
//  GameRowView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/30.
//

import SwiftUI

struct GameRowView: View {
    var game: GameProfile
    var body: some View {
        HStack(alignment: .center) {
            HStack {
            Text(" NO.").bold().font(.callout).font(.system(size: 60))
            Text(game.fractionOfFinal).bold().font(.callout).font(.system(size: 60))
            }.padding()
            Spacer()
        
            HStack {
                Text(game.teamRedName).bold().font(.callout).font(.system(size: 60))
                
            }.padding()
            Spacer()
            Text("v.s.").bold().font(.callout).font(.system(size: 60))
            HStack {
            Text(game.teamBlueName).bold().font(.callout).font(.system(size: 60))
            }.padding()
            Spacer()
        }.frame(height: 100)
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: .demogame).previewLayout(.fixed(width: 320, height: 100))
    }
}
