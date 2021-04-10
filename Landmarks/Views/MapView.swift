//
//  MapView.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/3/29.
//

import SwiftUI
// 导入地图库
import MapKit

struct MapView: View {
    // @State 表示UI和数据同步，数据变化UI跟着变化。
    // @State 声明 private 私有 var 变量 = 坐标区域
    @State private var region = MKCoordinateRegion(
        // 聚焦： 2D位置坐标
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        // 跨度：坐标跨度
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // 调用地图(定位坐标：$region）
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}