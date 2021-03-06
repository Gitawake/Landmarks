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
                // 图片圆角
                .cornerRadius(5)
            VStack(alignment: .leading) {
                // 获取数据地标名称
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            
            // 间隔物(垫片)
            Spacer()
            
            // 判断isFavorite
            if landmark.isFavorite {
                // 显示星星图案
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    // 给星星上色
                    .foregroundColor(.yellow)
                    
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
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
