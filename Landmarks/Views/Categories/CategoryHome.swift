//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/16.
//

import SwiftUI

struct CategoryHome: View {
    // 从环境读取数据
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        // 导航视图
        NavigationView {
            List {
                modelData.features[0].image
                    // 可调整大小属性
                    .resizable()
                    // 自动缩放比例
                    .scaledToFill()
                    // 宽度
                    .frame(height: 200)
                    // 裁剪超出边框部分
                    .clipped()
                    // 边缘插图设置为零
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // 引入视图
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // 边缘插图设置为零
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            // 使用模型数据向下给视图传递数据
            .environmentObject(ModelData())
    }
}
