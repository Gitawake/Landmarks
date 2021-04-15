//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/15.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    // 定义一个角度常量
    let angle: Angle
    
    var body: some View {
        // 引用绘制的图形
        BadgeSymbol()
            .padding(-60)
            // 旋转
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
