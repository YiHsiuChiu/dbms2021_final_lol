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
                    HStack {
                        Text("Region: ").font(.system(size: 20)).bold()
                        Spacer()
                        Spacer()
                        Text(team.regionName).font(.callout).font(.system(size: 60)).bold()
                    }.padding()
                    Divider()
                    var teamPlayer: [PlayerProfile] = getPlayerList(name: team.teamName)
                    Text("Current Member: ").font(.system(size: 20)).bold().padding()
                        List(teamPlayer) {
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

private func getPlayerList(name: String) -> [PlayerProfile] {
    var mutex = false
    var DataList : [PlayerProfile]=[];
    let address = "http://140.119.163.196:8081/player/teamname/\(name)"
    if let url = URL(string: address) {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                print(data)
                print("Status code: \(response.statusCode)")
                do {
                    DataList = try JSONDecoder().decode([PlayerProfile].self, from: data)
                    print("success")
                    print("this is ",DataList)
                    mutex = true
                } catch {
                    fatalError("Error: \(error.localizedDescription)")
                }
            }
        }.resume()
    } else {
        print("Invalid URL.")
    }
//    print("test")
    while(!mutex){}
    return DataList
}


private func base64toImage(imageBase64String: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: imageBase64String, options: .ignoreUnknownCharacters) else {
        return nil
    }
    
    return UIImage(data: imageData)
}
