//
//  GameView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct GameView: View {
    var game: GameProfile
    
//    @State var progressValue: Float = 0.5
    var body: some View {
        VStack {
            HStack {
                Text("Fraction Of Final").bold().padding([.leading, .bottom, .trailing]).font(.title)
                Text("No.").bold().font(.title).padding([.leading, .bottom])
                Text(game.fractionOfFinal).bold().font(.title).padding(.bottom)
                Spacer()
            }
            Divider()
            HStack {
                Spacer()
                ZStack {
                    Color.pink
                    VStack {
                        Text(game.teamRedName).bold().font(.title3).padding()
                        Text(game.teamRedRegion).bold().font(.title3).padding()
                        if(game.endTime=="null"){
                            Button(action: {
                                print("Voted!")
                            }) {
                                Text("Vote me !").padding()
                            }.background(Color.white).cornerRadius(25)
                        }
                    }
                }
                ZStack {
                    Color.blue
                    VStack {
                        Text(game.teamBlueName).bold().font(.title3).padding()
                        Text(game.teamBlueRegion).bold().font(.title3).padding()
                        if(game.endTime=="null"){
                            Button(action: {
                                print("Voted!")
                            }) {
                                Text("Vote me !").padding()
                            }.background(Color.white).cornerRadius(25)
                        }
                    }
                }
                Spacer()
            }
            HStack {
                Text("Start Time:").bold().font(.title3).padding([.top, .leading])
                Text(game.startTime).bold().font(.title3).padding(.top)
                Spacer()
                Text("End Time:").bold().font(.title3).padding(.top)
                Text(game.endTime).bold().font(.title3).padding([.top, .trailing])
            }
            Divider()
            HStack {
                Text("Winner").bold().font(.title3).padding()
                Spacer()
                Text(game.winner).bold().font(.title3).padding()
            }
            Divider()
            HStack {
                Text("Mvp").bold().font(.title3).padding()
                Spacer()
                Text(game.mvp).bold().font(.title3).padding()
            }
            
            VStack {
                let result = Float(game.nOfRedVote)/(Float(game.nOfBlueVote)+Float(game.nOfRedVote))
                ProgressBar(value: result).frame(height: 20)
                Spacer()
            }.padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: .demogame)
    }
}

struct ProgressBar: View {
    var value: Float
    
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
