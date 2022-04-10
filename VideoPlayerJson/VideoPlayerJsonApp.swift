//
//  VideoPlayerJsonApp.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

@main
struct VideoPlayerJsonApp: App {
    
    @StateObject var videoManagerVM = VideoManagerViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(videoManagerVM)
        }
    }
}
