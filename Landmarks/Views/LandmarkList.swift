//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/10.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // 添加导航
        NavigationView{
            // 展开列表
            List(landmarks) { landmark in
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
        LandmarkList()
    }
}
