//
//  PlayerProfile.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/23.
//

import SwiftUI
import Foundation

struct PlayerProfile: Identifiable, Hashable, Decodable{
    let id = UUID()
    var playerid:String
    var team:String
    var name:String
    var role:String
    var mvpNum:String
    var image:String?
}

extension PlayerProfile {
    static var demoplayer: PlayerProfile {
        PlayerProfile(playerid: "1234567",team: "Test",name: "Jfish",role: "Test",mvpNum: "1234567", image: "TestImage")
    }
}


//參考https://www.wpgdadatong.com/tw/blog/detail?BID=B2587這篇，若選手資料預計從資料庫中撈的話，就不能用JSON檔寫死（？），所以data還需要之後再寫
