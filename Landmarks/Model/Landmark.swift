//
//  Landmark.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/3/30.
//

import Foundation
import SwiftUI
import CoreLocation

// struct 结构：Hashable 哈希键值校验， Codable json解析， Identifiable 简化唯一标识获取方式
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    //从数据中读取图像名称
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //  从数据中读取图像名称 如果存在的话
    var featureImage: Image? {
        // 如果isFeatured等于true，返回图像名字，否则返回空
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    //利用CoreLocation把数据转换成坐标地址
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    //从数据中读取嵌套数据
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

