//
//  CircleImage.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/3/29.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        // Image + 图片名字 调用图片显示
        Image("turtlerock")
            // clipShape 图片形状裁剪 Circle() 圆圈
            .clipShape(Circle())
            // overlay 填充覆盖 圆圈 表面(颜色, 线宽）
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            // 阴影
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
