//
//  ModelData.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/9.
//

import Foundation
// 导入Combine框架，用于页面跟随数据更新
import Combine

final class ModelData: ObservableObject {
    // 绑定定义好的结构，实例化load传入json文件名
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // 不会在初始加载后修改加息数据，所以不需要使用@Published属性
    var hikes: [Hike] = load("hikeData.json")
    // 定义一个读写
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // 给类别绑定地标数据
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// 利用Decodable解释JSON
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Bundle，尝试在工程下寻找文件，失败抛出致命错误提示
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // 尝试读取文件，失败抛出致命错误提示
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // 尝试把文件解析为json，失败抛出致命错误提示
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
