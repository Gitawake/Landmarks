//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/10.
//

import SwiftUI

struct LandmarkList: View {
    // 定义一个是否仅显示收藏的变量
    @State private var showFavoritesOnly = true
    
    // 过滤已被收藏列表
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // 添加导航
        NavigationView{
            // 展开列表
            List(filteredLandmarks) { landmark in
                // 添加页面跳转，并向下个页面传递数据
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
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
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
