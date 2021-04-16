//
//  ContentView.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/3/28.
//

// 导入库
import SwiftUI

// 方法结构
struct ContentView: View {
    // 定义私有变量提供一个默认tab值
    @State private var selection: Tab = .featured
    
    // 枚举tab模式
    enum Tab {
        case featured
        case list
    }
    // 内容与布局
    var body: some View {
        // 定义tab用于切换列表模式
        TabView(selection: $selection) {
            CategoryHome()
                // tab按钮
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                // tab按钮
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

// 调用预览
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            // 使用模型数据
            .environmentObject(ModelData())
    }
}
