//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/10.
//

import SwiftUI

struct LandmarkRow: View {
    // 引入自定义结构数据
    var landmark: Landmark
    
    var body: some View {
        // 行容器
        HStack {
            // 获取数据地标图片
            landmark.image
                // 添加可变大小属性
                .resizable()
                // 指定图片大小
                .frame(width: 50, height: 50)
            // 获取数据地标名称
            Text(landmark.name)
            
            // 间隔物(垫片)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 加载预览视图参数
            LandmarkRow(landmark: landmarks[0])
            // 加载预览时图参数
            LandmarkRow(landmark: landmarks[1])
        }
        // 设置预览时图大小为列表一行的大小
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
