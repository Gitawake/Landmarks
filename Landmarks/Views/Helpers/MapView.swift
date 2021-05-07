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
    var coordinate: CLLocationCoordinate2D
    // @State 表示UI和数据同步，数据变化UI跟着变化。
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        // 调用地图(定位坐标：$region）
        Map(coordinateRegion: .constant(region))
    }
    
    // 基于坐标值更新区域的方法
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate:CLLocationCoordinate2D(latitude: 34.011_286, longitude:-116.166_868))
    }
}
