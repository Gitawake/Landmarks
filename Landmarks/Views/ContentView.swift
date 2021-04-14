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
        LandmarkList()
    }
}

// 调用预览
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            // 使用模型数据向下给视图传递数据
            .environmentObject(ModelData())
    }
}
