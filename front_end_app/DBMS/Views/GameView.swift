//
//  GameView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI


struct GameView: View {
    var game: GameProfile

    @State var progressValue: Float = 0.5
    @State var endTime:String? = nil
    @State var winner:String? = nil
    @State var mvp:String? = nil

    var body: some View {
        if #available(iOS 15.0, *) {
            var red = 0
            var blue = 0
            VStack {
                HStack {
                    Text(game.fractionOfFinal).bold().padding([.leading, .bottom, .trailing]).font(.title)
                    Text("No.").bold().font(.title).padding([.leading, .bottom, .trailing]).frame(maxWidth: .infinity, alignment: .trailing)
                    Text(String(game.no)).bold().font(.title).padding(.bottom)
                    Spacer()
                }
                Divider()
                HStack {
                    Spacer()
                    NavigationLink {
                        TeamView(team: getTeam(teamName: game.teamRedName))
                    } label: {
                        ZStack {
                            Color.pink
                            VStack {
                                Text(game.teamRedName).bold().font(.title3).padding().foregroundColor(Color.black)
                                //                        Text(game.teamRedRegion).bold().font(.title3).padding()
                                if(endTime==nil){
                                    Button(action: {
                                        userVote(time: game.startTime,account: userAccount ,winner: game.teamRedName)
                                    }) {
                                        Text("Vote me !").padding()
                                    }.background(Color.white).cornerRadius(25)
                                }
                            }
                        }
                        .cornerRadius(15)
                    }
                    NavigationLink {
                        TeamView(team: getTeam(teamName: game.teamBlueName))
                    } label: {
                        ZStack {
                            Color.blue
                            VStack {
                                Text(game.teamBlueName).bold().font(.title3).padding().foregroundColor(Color.black)
                                //                        Text(game.teamBlueRegion).bold().font(.title3).padding()
                                if(endTime==nil){
                                    Button(action: {
                                        userVote(time: game.startTime,account: userAccount ,winner: game.teamBlueName)
                                    }) {
                                        Text("Vote me !").padding()
                                    }.background(Color.white).cornerRadius(25)
                                }
                            }
                            
                        }
                        .cornerRadius(15)
                    }
                    Spacer()
                }
                HStack {
                    Text("Start Time:").bold().font(.title3).padding([.top, .leading])
                    Text(timeFormat(time: game.startTime)).bold().font(.title3).padding(.top)
                    Spacer()
                    Text("End Time:").bold().font(.title3).padding(.top)
                    Text(timeFormat(time: endTime ?? "")).bold().font(.title3).padding([.top, .trailing])
                }
                Divider()
                HStack {
                    Text("Winner").bold().font(.title3).padding()
                    Spacer()
                    Text(winner ?? "").bold().font(.title3).padding()
                }
                Divider()
                HStack {
                    Text("Mvp").bold().font(.title3).padding()
                    Spacer()
                    Text(mvp ?? "").bold().font(.title3).padding()
                }
                
                VStack {
//                    let red = Int(game.nOfRedVote) ?? 0
//                    let blue = Int(game.nOfBlueVote) ?? 0
//                    let result = Float(red) / (Float(red) + Float(blue))
                    ProgressBar(value: $progressValue).frame(height: 20)
                    Spacer()
                }.padding()
            }.onAppear{
                
                let temp : [GameProfile]=updateDate(startTime: game.startTime)
                red = Int(temp[0].nOfRedVote) ?? 0
                blue = Int(temp[0].nOfBlueVote) ?? 0
                endTime = temp[0].endTime
                winner = temp[0].winner
                mvp = temp[0].mvp
                
                progressValue = Float(red) / (Float(red) + Float(blue))
                print(endTime ?? nil)
                print(winner ?? nil)
                print(mvp ?? nil)
//                print(progressValue)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: .demogame)
    }
}

func updateDate(startTime: String) -> [GameProfile]{
    let address = "http://140.119.163.196:8081/game/vote"
    //POST
    var mutex = false
    var DataList : [GameProfile]=[];
    var request = URLRequest(url: URL(string: address)!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    let postTime = timeFormat(time: startTime)
    let parameters = ["startTime": postTime]
    print(parameters)
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else if let response = response as? HTTPURLResponse,let data = data {
            print(data)
            print("Status code: \(response.statusCode)")
            do {
                DataList = try JSONDecoder().decode([GameProfile].self, from: data)
                print("success")
//                    print("gamegamegame")
                 print("this is ",DataList)
                mutex = true
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }.resume()
    while(!mutex){}
    return DataList
}

func userVote(time: String, account: String, winner: String) {
    let address = "http://140.119.163.196:8081/vote"
    //POST
    var request = URLRequest(url: URL(string: address)!)
    let postTime = timeFormat(time: time)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    let parameters = ["startTime": postTime, "username": account, "winner": winner]
    print(parameters)
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else if let response = response as? HTTPURLResponse,let data = data {
            print(data)
            print("Status code: \(response.statusCode)")
            if response.statusCode == 200 {
                print("Voted!")
            }
        }
    }.resume()

}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemBlue))
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemRed))
            }.cornerRadius(45.0)
        }
    }
}


