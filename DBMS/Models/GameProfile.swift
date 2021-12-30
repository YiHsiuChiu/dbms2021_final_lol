//
//  GameProfile.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/30.
//

import SwiftUI

import SwiftUI
import Foundation

struct GameProfile: Identifiable,Codable, Hashable{
    let id = UUID()
    var teamRedName:String
    var teamBlueName:String
    var teamBlueRegion:String
    var teamRedRegion:String
    var fractionOfFinal:String
    var startTime:String
    var endTime:String
    var winner:String
    var mvp:String
}

extension GameProfile {
    static var demogame: GameProfile {
        GameProfile(teamRedName: "TTT", teamBlueName: "HHH", teamBlueRegion: "Taiwan", teamRedRegion: "America", fractionOfFinal: "2", startTime: "18:00", endTime: "19:00", winner: "TTT", mvp: "Jfish")
    }
}

