//
//  CircleImageView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/28.
//

import SwiftUI

struct CircleImageView: View {
    var image: UIImage?
    var size: CGFloat
    var body: some View {
        // Image(imageName).resizable()
        //     .frame(width: size, height: size)
        //     .scaledToFit()
        //     .clipShape(Circle())
        //     .overlay(Circle().stroke(Color.white, lineWidth: 4))
        //     .shadow(radius: 5)
        Image(uiImage: image ?? UIImage())
            .resizable()
            .frame(width: size, height: size)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: UIImage(), size: 200)
    }
}

//照片細節可再調整 目前先用測試照片
