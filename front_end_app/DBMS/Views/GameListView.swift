//
//  GameListView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/30.
//

import SwiftUI

struct GameListView: View {
    @State private var searchText = ""
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
            
                List(gameData.filter({ searchText.isEmpty ? true : $0.teamRedName.contains(searchText) })) { game in
                    NavigationLink (
                        destination: GameView(game: game)) {
                        GameRowView(game: game)
                        }
                    }.navigationBarTitle(Text("Game List"))
            }.searchable(text: $searchText).onAppear(perform: refresh )
        }
    }
}

func refresh(){
    var mutex = false
    let address = "http://localhost:8081/game/starttime/0"
    if let url = URL(string: address) {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                print(data)
                print("Status code: \(response.statusCode)")
                do {
                    gameData = try JSONDecoder().decode([GameProfile].self, from: data)
                    print("success")
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
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
