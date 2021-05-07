//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by 苏相荣 on 2021/5/7.
//

import SwiftUI
import MapKit

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
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                // 调用自定义地图方法
                MapView(coordinate: landmark.locationCoordinate)
                    // 将内容拓展到屏幕顶部（状态栏）
                    .ignoresSafeArea(edges: .top)
                    // 限制高度 300
                    .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    // 调用自定义图片方法
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
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
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                        // 行容器
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            
                            Text(landmark.state)
                        }
                        // 字体设置为副标题
                        .font(.subheadline)
                        // 字体颜色设置为灰色
                        .foregroundColor(.secondary)
                    }
                    
                }
                
                // 分割线
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            // 边填充
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    // 定义静态常量实例化
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            // 使用模型数据向下给视图传递数据
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}
