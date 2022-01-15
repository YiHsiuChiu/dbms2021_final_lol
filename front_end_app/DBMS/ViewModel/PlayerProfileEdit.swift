//
//  PlayerProfileEdit.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import UIKit
import SwiftUI

//var playerData: [PlayerProfile] = load("Players.json")
// var teamData: [TeamProfile] = load("Teams.json")
//var gameData: [GameProfile] = load("Games.json")

var mutexServer = false;

var gameData: [GameProfile] = []
//var gameData: [GameProfile] = getGameList()
//var playerData: [PlayerProfile] = getPlayerList()
var playerData: [PlayerProfile] = []
//var teamData: [TeamProfile] = getTeamList()
var teamData: [TeamProfile] = []



func getPlayerList() -> [PlayerProfile] {
    var mutex = false
    var DataList : [PlayerProfile]=[];
    let address = "http://140.119.163.196:8081/player"
    if let url = URL(string: address) {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                // print(data)
                print("Status code: \(response.statusCode)")
                do {
                    DataList = try JSONDecoder().decode([PlayerProfile].self, from: data)
                    print("success")
                    // print("this is ",DataList)
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

func getTeamList() -> [TeamProfile] {
    var mutex = false
    var DataList : [TeamProfile]=[];
    let address = "http://140.119.163.196:8081/team"
    if let url = URL(string: address) {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                // print(data)
                print("Status code: \(response.statusCode)")
                do {
                    DataList = try JSONDecoder().decode([TeamProfile].self, from: data)
                    print("success")
                    // print("this is ",DataList)
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

func getGameList() -> [GameProfile] {
    var mutex = false
    var DataList : [GameProfile]=[];
    let address = "http://140.119.163.196:8081/game"
    if let url = URL(string: address) {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                // print(data)
                print("Status code: \(response.statusCode)")
                do {
                    DataList = try JSONDecoder().decode([GameProfile].self, from: data)
                    print("success")
                    // print("this is ",DataList)
                    mutex = true
                } catch {
                    fatalError("Error: \(error.localizedDescription)")
                }
            }
        }.resume()
    } else {
        print("Invalid URL.")
    }
    while(!mutex){}
    return DataList
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")

    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }

}


