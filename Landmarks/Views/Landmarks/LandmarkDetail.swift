//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/10.
//

import SwiftUI

struct LandmarkDetail: View {
    // 环境变量模型
    @EnvironmentObject var modelData: ModelData
    
    // 从结构获取数据
    var landmark: Landmark
    
    // id绑定
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        // ScrollView 添加滚动条功能
        ScrollView {
            // 调用自定义地图方法
            MapView(coordinate: landmark.locationCoordinate)
                // 将内容拓展到屏幕顶部（状态栏）
                .ignoresSafeArea(edges: .top)
                // 限制高度 300
                .frame(height: 300)
            
            // 调用自定义图片方法
            CircleImage(image: landmark.image)
                // 把图片垂直偏移 -130
                .offset(y: -130)
                // 把底部内边距 -130
                .padding(.bottom, -130)
            // VStack 列容器  // alignment 对齐方式
            VStack(alignment: .leading) {
                
                // 行容器
                HStack {
                    // 添加文本
                    Text(landmark.name)
                        // 字体形式
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    // 添加FavoriteButton视图,根据ID获取对应isFavorite状态
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                // 行容器
                HStack {
                    Text(landmark.park)
                    
                    // 间隔物(垫片)
                    Spacer()
                    
                    Text(landmark.state)
                }
                // 字体设置为副标题
                .font(.subheadline)
                // 字体颜色设置为灰色
                .foregroundColor(.secondary)
                
                // 分割线
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            // 边填充
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    // 定义静态常量实例化
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            // 使用模型数据向下给视图传递数据
            .environmentObject(modelData)
    }
}
