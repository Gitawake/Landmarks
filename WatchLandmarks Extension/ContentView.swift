//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 苏相荣 on 2021/4/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
