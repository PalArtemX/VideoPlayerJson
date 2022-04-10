//
//  HomeView.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var videoManager = VideoManager()
    let columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Query.allCases, id: \.self) { query in
                            QueryTagView(query: query, isSelected: videoManager.selectedQuery == query)
                                .onTapGesture {
                                    videoManager.selectedQuery = query
                                }
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    if videoManager.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: columns) {
                            ForEach(videoManager.videos, id: \.id) { video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCardView(video: video)
                                }

                                
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.accentColor)
            .navigationBarHidden(true)
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
