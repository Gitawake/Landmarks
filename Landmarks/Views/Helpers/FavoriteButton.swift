//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/14.
//

import SwiftUI

struct FavoriteButton: View {
    // 绑定一个变量,用于储存按钮状态
    @Binding var isSet: Bool
    
    var body: some View {
        // 添加一个按钮
        Button(action: {
            // 纽扣按钮
            isSet.toggle()
        }) {
            // 如果isSet等于true 显示实心星星否则显示空心星星
            Image(systemName: isSet ? "star.fill" : "star")
                // 如果isSet等于true 显示黄色否则显示灰色
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        // 设定变量isSet为true
        FavoriteButton(isSet: .constant(true))
    }
}
