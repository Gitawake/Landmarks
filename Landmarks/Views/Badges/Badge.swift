//
//  Badge.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/15.
//

import SwiftUI

struct Badge: View {
    // 定义一个常量 表示需要复制展示的总量
    static let rotationCount = 8
    
    // 定义一个变量用于实例化RotatedBadgeSymbol
    var badgeSymbols: some View {
        
        // 循环复制多个
        ForEach(0..<Badge.rotationCount) { i in
            // 使用绘制的图形
            RotatedBadgeSymbol(
                // 角度
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        
        // 叠加容器
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    // 缩放图形 固定顶部
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    // 位置
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
