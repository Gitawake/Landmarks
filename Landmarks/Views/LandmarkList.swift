//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/10.
//

import SwiftUI

struct LandmarkList: View {
    // 修饰器自动获取值
    @EnvironmentObject var modelData: ModelData
    // 定义一个是否仅显示收藏的变量
    @State private var showFavoritesOnly = false
    
    // 过滤已被收藏列表
    var filteredLandmarks: [Landmark] {
        // 引用ModelData更新页面
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // 添加导航
        NavigationView{
            // 创建一个列表
            List {
                // 添加一个切换按钮
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // 循环展开地标列表
                ForEach (filteredLandmarks) { landmark in
                    // 添加页面跳转，并向下个页面传递数据
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // 导航栏标题
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // 指定机型预览视图
//        ForEach(["iPhone SE (2nd generation)","iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
