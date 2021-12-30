//
//  MemberProfile.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI
import Foundation

struct MemberProfile: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}
