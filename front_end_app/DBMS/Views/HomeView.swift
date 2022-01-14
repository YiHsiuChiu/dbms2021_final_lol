//
//  HomeView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct HomeView: View {
    var nextGame: GameProfile = getNextGame()
    var body: some View {
        NavigationView {
            VStack {
                Text("下一場比賽")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                NavigationLink {
                    GameView(game: nextGame)
                } label: {
                    VStack {
                        HStack{
                            VStack{
                                Image("ig")
                                Text(nextGame.teamRedName)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
//                                Text(nextGame.teamRedRegion)
//                                    .font(.headline)
//                                    .foregroundColor(.secondary)
                            }
                            Text("VS")
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                            VStack{
                                Image("facebook")
                                Text(nextGame.teamBlueName)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
//                                Text(nextGame.teamBlueRegion)
//                                    .font(.headline)
//                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack {
                            VStack{
                                Text(timeFormat(time: nextGame.startTime))
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }.padding().background(Color(.systemGray3))
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private func getNextGame() -> GameProfile {
    for game in gameData {
        if game.endTime == "null" && game.winner == "null" && game.mvp == "null" {
            return game
        }
    }

    return gameData[0]
}

private func timeFormat(time: String) -> String{
    return time.replacingOccurrences(of: "T", with: " ").components(separatedBy: ".")[0]    
}
