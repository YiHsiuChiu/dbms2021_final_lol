//
//  PlayerProfileEdit.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import UIKit
import SwiftUI

let playerData: [PlayerProfile] = load("Players.json")
let teamData: [TeamProfile] = load("Teams.json")
let gameData: [GameProfile] = load("Games.json")

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


