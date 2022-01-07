//
//  TeamRowView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI

struct TeamRowView: View {
    var team: TeamProfile
    var body: some View {
        HStack {
            CircleImageView(imageName: team.image, size: 80).padding()
            Text(team.teamName).bold().font(.callout).font(.system(size: 60))
            Spacer()
        }.frame(height: 100)
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRowView(team: .demoteam).previewLayout(.fixed(width: 320, height: 100))
    }
}
