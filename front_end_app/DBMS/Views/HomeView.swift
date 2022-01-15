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

func timeFormat(time: String) -> String{
    if time == "null" || time == "" {
        return "null"
    }
    let format_time: String = time.replacingOccurrences(of: "T", with: " ").components(separatedBy: ".")[0]
    
    let sep_dash: [String] = format_time.components(separatedBy: " ")[0].components(separatedBy: "-")
    let year: String = sep_dash[0]
    let month: String = sep_dash[1]
    var day: String = sep_dash[2]
    let sep_colon: [String] = format_time.components(separatedBy: " ")[1].components(separatedBy: ":")
    var hours: String = sep_colon[0]
    let min: String = sep_colon[1]
    
    if 8 + (Int(hours) ?? 0)! >= 24 {
        hours = String(8 + (Int(hours) ?? 0)! - 24)
        day = String((Int(day) ?? 0)! + 1)
    } else {
        hours = String((Int(hours) ?? 0)! + 8)
    }
    let ret: String = year + "-" + month + "-" + day + " " + hours + ":" + min

    return ret
}