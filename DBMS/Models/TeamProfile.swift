//
//  TeamProfile.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI
import Foundation

struct TeamProfile: Identifiable,Codable, Hashable{
    let id = UUID()
    var teamName:String
    var image:String
}

extension TeamProfile {
    static var demoteam: TeamProfile {
        TeamProfile(teamName: "GoGoGo", image: "TestImage")
    }
}

