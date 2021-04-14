//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/3/28.
//

import SwiftUI

// main 程序入口
@main
struct LandmarksApp: App {
    // 初始化模型数据
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // 使用模型数据
                .environmentObject(modelData)
        }
    }
}
