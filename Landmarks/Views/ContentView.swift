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
    // 内容与布局
    var body: some View {
        
        VStack {
            // 调用自定义地图方法
            MapView()
                // 将内容拓展到屏幕顶部（状态栏）
                .ignoresSafeArea(edges: .top)
                // 限制高度 300
                .frame(height: 300)
            
            // 调用自定义图片方法
            CircleImage()
                // 把图片垂直偏移 -130
                .offset(y: -130)
                // 把底部内边距 -130
                .padding(.bottom, -130)
            // VStack 列容器  // alignment 对齐方式
            VStack(alignment: .leading) {
                
                // 添加文本
                Text("Turtle Rock")
                    // 字体形式
                    .font(.title)
                
                // 行容器
                HStack {
                    Text("Joshua Tree National Park")
                    
                    // 间隔物(垫片)
                    Spacer()
                    
                    Text("California")
                }
                // 字体设置为副标题
                .font(.subheadline)
                // 字体颜色设置为灰色
                .foregroundColor(.secondary)
                
                // 分割线
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            // 边填充
            .padding()
            // 间隔物(垫片)
            Spacer()
            
        }
    }
}

// 调用预览
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
