//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 苏相荣 on 2021/4/16.
//

import SwiftUI

struct ProfileSummary: View {
    // 从环境中读取数据模型
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    var body: some View {
        // 滚动条
        ScrollView {
            // 垂直容器
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                // 分割
                Divider()
                
                // 垂直容器
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    // 滚动条
                    ScrollView(.horizontal) {
                        // 水平容器
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                // 分割
                Divider()
                
                //垂直容器
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            // 使用数据模型
            .environmentObject(ModelData())
    }
}
