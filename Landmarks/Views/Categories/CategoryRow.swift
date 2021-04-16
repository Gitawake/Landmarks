//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/16.
//

import SwiftUI

struct CategoryRow: View {
    // 定义一个变量类型
    var categoryName: String
    // 定义一个变量储存数据模型
    var items: [Landmark]
    
    var body: some View {
        // 垂直容器
        VStack(alignment: .leading) {
            // 类别名称
            Text(categoryName)
                // 字号
                .font(.headline)
                // 前边距
                .padding(.leading, 15)
                // 顶部边距
                .padding(.top, 5)
            
            // 滚动条
            ScrollView(.horizontal, showsIndicators: false) {
                // 水平容器
                HStack(alignment: .top, spacing: 0) {
                    // 循环展示
                    ForEach(items) { landmark in
                        // 导航链接
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            // 引入视图
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    // 定义一个静态变量用于加载数据
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            // 给变量赋值
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
