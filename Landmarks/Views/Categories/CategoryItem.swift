//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/16.
//

import SwiftUI

struct CategoryItem: View {
    // 定义变量储存数据模型
    var landmark: Landmark
    
    var body: some View {
        // 垂直容器
        VStack(alignment: .leading) {
            landmark.image
                // 渲染模式
                .renderingMode(.original)
                // 拉伸图片大小
                .resizable()
                // 定义图片大小
                .frame(width: 155, height: 155)
                // 圆角
                .cornerRadius(5)
            Text(landmark.name)
                // 前底色
                .foregroundColor(.primary)
                .font(.caption)
            
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
