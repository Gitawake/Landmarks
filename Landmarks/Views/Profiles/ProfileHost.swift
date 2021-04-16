//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/16.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            // 水平容器
            HStack {
                // 如果wrappedValue处于活动状态
                if editMode?.wrappedValue == .active {
                    // 取消按钮
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        // 状态置为非活动
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                // 垫片
                Spacer()
                // 编辑按钮
                EditButton()
            }
            
            // 如果editMode处于非活动状态
            if editMode?.wrappedValue == .inactive {
                // 展示视图
                ProfileSummary(profile: modelData.profile)
            } else {
                // 否则
                ProfileEditor(profile: $draftProfile)
                    // 出现时
                    .onAppear {
                        // 加载draftProfile
                        draftProfile = modelData.profile
                    }
                    // 消失时
                    .onDisappear {
                        // 把内容加载到draftProfile
                        modelData.profile = draftProfile
                    }
            }
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
