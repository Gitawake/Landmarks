//
//  ModelData.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/9.
//

import Foundation

// 绑定定义好的结构，实例化load传入json文件名
var landmarks:[Landmark] = load("landmarkData.json")

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
