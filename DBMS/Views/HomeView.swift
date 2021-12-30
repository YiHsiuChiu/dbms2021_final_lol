//
//  HomeView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image("TestImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack{
                    Text("日期")
                        .font(.headline)
                .foregroundColor(.secondary)
                    Text("我是當日比賽細節顯示板")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("目前賽事積分".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }.padding().background(Color(.systemGray3))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
