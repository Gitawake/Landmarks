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
    
    @State private var showingProfile = false
    
    var body: some View {
        // 导航视图
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    // 边缘插图设置为零
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // 引入视图
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // 边缘插图设置为零
                .listRowInsets(EdgeInsets())
            }
            // 删除弹窗小哥哥导致的插图
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            
            // 工具栏
            .toolbar {
                // 按钮
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            // 弹窗效果
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
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
