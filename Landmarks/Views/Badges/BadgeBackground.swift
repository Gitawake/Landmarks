//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/15.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        // GeometryReader 提供view的size
        GeometryReader { geometry in
            Path { path in
                // 定义容器大小为视图大小
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                // 缩放调整形状
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                // 光标移动至开始绘图位置
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                // 加载六边形数据模型
                HexagonParameters.segments.forEach { segment in
                    // 根据模型数据绘制
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    
                    // 绘制拐角处的贝塞尔曲线
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            // LinearGradient 线性渐变
            .fill(LinearGradient(
                gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // 保持1:1纵横比例
        .aspectRatio(1, contentMode: .fit)
    }
    // 定义两个渐变 开始和结束色值
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
